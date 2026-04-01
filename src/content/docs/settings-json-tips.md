---
title: "settings.json"
order: 4
---

Controls permissions and tool access. Rules here are enforced and cannot be talked around.

## Where It Lives

| Scope                | Location                      | Use case                               |
| -------------------- | ----------------------------- | -------------------------------------- |
| **User**             | `~/.claude/settings.json`     | Personal defaults across all projects  |
| **Project (shared)** | `.claude/settings.json`       | Team standards, committed to git       |
| **Project (local)**  | `.claude/settings.local.json` | Personal project overrides, gitignored |

Settings merge across scopes. Deny rules always win.

## Block Sensitive Files

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

Written rules in a CLAUDE.md can be ignored under pressure. Deny rules in settings.json cannot.

**Pattern syntax:** `./.env.*` matches relative files. `~/.ssh/**` matches recursively under a directory.

## Pre-Approve Common Commands

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

## Gate Dangerous Commands

```json
{
  "permissions": {
    "ask": ["Bash(git push *)", "Bash(docker *)", "Bash(rm *)"]
  }
}
```

## Permission Modes

```json
{
  "permissions": {
    "defaultMode": "acceptEdits"
  }
}
```

| Mode                | What it does                                               |
| ------------------- | ---------------------------------------------------------- |
| `default`           | Prompts for permission on first use of each tool           |
| `acceptEdits`       | Auto-approves file edits, prompts for Bash and other tools |
| `plan`              | Read-only. Claude can analyze but not modify anything      |
| `bypassPermissions` | Skips all prompts (isolated/sandboxed environments only)   |

## Scope Edits to Directories

```json
{
  "permissions": {
    "allow": ["Edit(/src/**)", "Edit(/tests/**)"],
    "deny": ["Edit(/infrastructure/**)", "Edit(/.github/**)"]
  }
}
```

## Related

- [Hooks](hooks) for automated checks on tool events
- [Agent Teams](agent-teams) for coordinating parallel agents
- [What is a CLAUDE.md?](what-is-a-claude-md) for the other half of configuring Claude Code
