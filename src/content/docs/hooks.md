---
title: "Hooks"
order: 5
---

Hooks are shell commands that run automatically in response to Claude Code events. They live in your `settings.json` under the `hooks` key.

## Example: Docs Check

The playbook includes a hook that nudges Claude when code is committed without documentation updates:

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

The script checks for `git commit`, diffs the last commit, and outputs a reminder if code changed but no `.md` files did. The output goes to Claude as context. It's a nudge, not a blocker.

## Hook Events

| Event              | When it fires                   | Use case                                    |
| ------------------ | ------------------------------- | ------------------------------------------- |
| `PreToolUse`       | Before a tool runs              | Validate inputs, block dangerous operations |
| `PostToolUse`      | After a tool runs               | Check results, trigger follow-up actions    |
| `SessionStart`     | When a session begins           | Load context, initialize state              |
| `UserPromptSubmit` | When the user sends a message   | Inject relevant context                     |
| `Stop`             | When Claude finishes a response | Final checks, cleanup                       |

## How They Work

- **Matcher** filters which tool triggers the hook (e.g., `Bash`, `Write|Edit`)
- **Exit code 0** means proceed. Stdout is added to Claude's context.
- **Exit code 2** means block. Stderr becomes Claude's feedback.
- **Environment variables** include `TOOL_INPUT`, `TOOL_NAME`, and `TOOL_RESULT`.

## Common Hooks

**Auto-format on save:**

```json
{
  "PostToolUse": [
    {
      "matcher": "Write|Edit",
      "hooks": [
        {
          "type": "command",
          "command": "npx prettier --write \"$TOOL_INPUT_FILE_PATH\" 2>/dev/null || true",
          "timeout": 10
        }
      ]
    }
  ]
}
```

**Block push to main:**

```json
{
  "PreToolUse": [
    {
      "matcher": "Bash",
      "hooks": [
        {
          "type": "command",
          "command": "echo \"$TOOL_INPUT\" | grep -qE 'push.*(main|master)' && echo 'BLOCKED: Never push directly to main' >&2 && exit 2 || exit 0",
          "timeout": 5
        }
      ]
    }
  ]
}
```

## Related

- [settings.json](/docs/settings-json-tips) for permissions and deny rules
- [Agent Teams](/docs/agent-teams) for coordinating parallel agents
