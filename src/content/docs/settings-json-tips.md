---
title: "settings.json Tips"
order: 4
---

Claude Code's `settings.json` controls permissions, tool access, and hooks. This page explains each setting in the [recommended standard](../.claude/settings.json) and how to customize them.

> **Quick install:** `cp .claude/settings.json ~/.claude/settings.json`. see the [README](../README.md#settings) for full install instructions including the docs-check hook.

## Where It Lives

| Scope                | Location                      | Use case                               |
| -------------------- | ----------------------------- | -------------------------------------- |
| **User**             | `~/.claude/settings.json`     | Personal defaults across all projects  |
| **Project (shared)** | `.claude/settings.json`       | Team standards, committed to git       |
| **Project (local)**  | `.claude/settings.local.json` | Personal project overrides, gitignored |

Settings merge across scopes. Deny rules always win, regardless of which scope they're in.

## Block Sensitive Files

The standards all include "never read `.env` files" as a written rule. The settings.json makes it enforceable:

```json
{
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(~/.aws/credentials)",
      "Read(~/.ssh/**)"
    ]
  }
}
```

This prevents Claude from reading these files even if explicitly asked. Written rules in a CLAUDE.md can be ignored under pressure. deny rules in settings.json cannot.

**Pattern syntax:**

- `./.env.*`. matches `.env.local`, `.env.production`, etc. relative to the current directory
- `~/.aws/credentials`. matches a specific file in your home directory
- `~/.ssh/**`. matches everything recursively under a directory

## Allow the Official Docs as a WebFetch Source

Let Claude pull from the official Claude Code documentation when it needs to look something up:

```json
{
  "permissions": {
    "allow": ["WebFetch(domain:docs.anthropic.com)"]
  }
}
```

You can allowlist other domains the same way:

```json
{
  "permissions": {
    "allow": [
      "WebFetch(domain:docs.anthropic.com)",
      "WebFetch(domain:github.com)",
      "WebFetch(domain:*.npmjs.org)"
    ]
  }
}
```

## Pre-Approve Common Commands

Stop clicking "allow" for commands you run dozens of times a day:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run *)",
      "Bash(npm install *)",
      "Bash(npx *)",
      "Bash(git add *)",
      "Bash(git commit *)",
      "Bash(git status)",
      "Bash(git log *)",
      "Bash(git diff *)"
    ]
  }
}
```

**Wildcard rules:** `Bash(npm run *)` matches `npm run build`, `npm run test`, etc. The space before `*` enforces a word boundary. `Bash(npm*)` would also match `npmx` or `npmabc`.

## Gate Dangerous Commands

Use `ask` for commands you want to run sometimes but always want to confirm:

```json
{
  "permissions": {
    "ask": ["Bash(git push *)", "Bash(docker *)", "Bash(rm *)"]
  }
}
```

These will prompt every time, even in permissive modes.

## Block Commands You Never Want Run

```json
{
  "permissions": {
    "deny": ["Bash(curl *)", "Bash(wget *)"]
  }
}
```

Deny rules take priority over allow and ask. they can't be overridden by any other scope.

## Set a Default Permission Mode

```json
{
  "permissions": {
    "defaultMode": "acceptEdits"
  }
}
```

| Mode                | What it does                                                     |
| ------------------- | ---------------------------------------------------------------- |
| `default`           | Prompts for permission on first use of each tool                 |
| `acceptEdits`       | Auto-approves file edits, still prompts for Bash and other tools |
| `plan`              | Read-only. Claude can analyze but not modify anything            |
| `bypassPermissions` | Skips all prompts (only use in isolated/sandboxed environments)  |

## Scope Edits to Specific Directories

Restrict where Claude can make changes:

```json
{
  "permissions": {
    "allow": ["Edit(/src/**)", "Edit(/tests/**)"],
    "deny": ["Edit(/infrastructure/**)", "Edit(/.github/**)"]
  }
}
```

## Give Claude Access to Additional Directories

By default, Claude can only access the current project directory. Open up adjacent repos or shared code:

```json
{
  "permissions": {
    "additionalDirectories": ["../shared-libs/", "~/work/design-system/"]
  }
}
```

## Add Hooks for Automated Checks

Hooks are shell commands that run in response to Claude Code events. They're defined in the `hooks` key of your settings.json.

The [recommended standard](../.claude/settings.json) includes a **docs-check hook**. a `PostToolUse` hook on Bash that fires after every shell command. When it detects a `git commit` that changed code but no documentation, it tells Claude to check if docs need updating.

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/docs-check.sh"
          }
        ]
      }
    ]
  }
}
```

The hook script ([`settings/hooks/docs-check.sh`](../.claude/hooks/docs-check.sh)) checks the tool input for `git commit`, diffs the last commit, and outputs a reminder if code was committed without any `.md` or `docs/` changes. The output is fed back to Claude as context. it's a nudge, not a blocker.

### Hook types

| Event          | When it fires                   | Use case                                    |
| -------------- | ------------------------------- | ------------------------------------------- |
| `PreToolUse`   | Before a tool runs              | Validate inputs, block dangerous operations |
| `PostToolUse`  | After a tool runs               | Check results, trigger follow-up actions    |
| `Notification` | On notifications                | Custom alerting                             |
| `Stop`         | When Claude finishes a response | Final checks, cleanup                       |

### Writing your own hooks

Hook commands receive environment variables including `TOOL_INPUT`, `TOOL_NAME`, and `TOOL_RESULT`. Any text the script writes to stdout is fed back to Claude as context. Exit code 0 means success; non-zero blocks the operation (for `PreToolUse`) or flags an issue.

## Use the Recommended Standard

The [`.claude/settings.json`](../.claude/settings.json) in this repo bundles all the tips above into a single file. deny rules, pre-approved commands, WebFetch allowlist, and the docs-check hook. Copy it and customize from there:

```bash
cp .claude/settings.json ~/.claude/settings.json

# Install the hook scripts
mkdir -p ~/.claude/hooks
cp .claude/hooks/*.sh ~/.claude/hooks/
chmod +x ~/.claude/hooks/*.sh
```

## Further Reading

- [Official Claude Code settings documentation](https://code.claude.com/docs/en/settings)
- [What is a CLAUDE.md?](what-is-a-claude-md.md). the other half of configuring Claude Code
