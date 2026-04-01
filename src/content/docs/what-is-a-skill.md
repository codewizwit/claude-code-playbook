---
title: "What Is a Skill?"
order: 3
---

A skill is a reusable prompt. detailed instructions in a markdown file that tell Claude what to do, what tools to use, and when to activate. Instead of explaining the same multi-step process every session, you write it once as a skill and invoke it with a slash command.

## How It Works

A skill lives in a directory with a `SKILL.md` file. The directory can also include supporting files. templates, examples, scripts. that the skill references.

```
my-skill/
├── SKILL.md           # Main instructions (required)
├── template.md        # Template for Claude to fill in (optional)
├── examples/
│   └── sample.md      # Example output (optional)
└── scripts/
    └── helper.sh      # Script Claude can execute (optional)
```

The `SKILL.md` has two parts: **YAML frontmatter** (configuration) and a **markdown body** (instructions).

```yaml
---
name: my-skill
description: What this skill does and when to use it.
---
Step-by-step instructions that Claude follows when this skill is invoked.
Reference supporting files so Claude knows when to load them.
```

When invoked, Claude reads the full `SKILL.md` and follows the instructions. Skill descriptions are loaded into context so Claude knows what's available, but the full content only loads when the skill is actually invoked.

## Where Skills Live

Where you store a skill determines who can use it:

| Location       | Path                               | Applies to                     |
| -------------- | ---------------------------------- | ------------------------------ |
| **Enterprise** | Managed settings                   | All users in your organization |
| **Personal**   | `~/.claude/skills/<name>/SKILL.md` | All your projects              |
| **Project**    | `.claude/skills/<name>/SKILL.md`   | This project only              |
| **Plugin**     | `<plugin>/skills/<name>/SKILL.md`  | Where plugin is enabled        |

Higher-priority locations win when names conflict: enterprise > personal > project. In monorepos, skills in nested `.claude/skills/` directories are discovered automatically when you work in those subdirectories.

## Frontmatter Fields

All fields are technically optional, but `name` and `description` should always be included in practice. Without a `name`, the directory name is used. Without a `description`, Claude falls back to the first paragraph of the markdown body. which is rarely as clear.

| Field                      | Required    | Description                                                                                                                                                        |
| -------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `name`                     | Recommended | Display name and `/slash-command`. Defaults to the directory name if omitted. Lowercase letters, numbers, hyphens only (max 64 chars).                             |
| `description`              | Recommended | What the skill does and when to use it. Claude uses this to decide when to load it automatically. Falls back to first paragraph of content if omitted.             |
| `disable-model-invocation` | No          | If `true`, only the user can trigger it via `/name`. Claude won't auto-invoke it. Default: `false`                                                                 |
| `user-invocable`           | No          | If `false`, hides the skill from the `/` menu. Use for background knowledge Claude should apply automatically but users shouldn't invoke directly. Default: `true` |
| `allowed-tools`            | No          | Tools Claude can use without asking permission when this skill is active (e.g., `Read, Write, Glob, Grep, Bash`)                                                   |
| `argument-hint`            | No          | Hint shown during autocomplete for expected arguments (e.g., `[file-path]`, `[issue-number]`)                                                                      |
| `model`                    | No          | Model to use when this skill is active                                                                                                                             |
| `context`                  | No          | Set to `fork` to run in an isolated subagent context                                                                                                               |
| `agent`                    | No          | Which subagent type to use when `context: fork` is set (e.g., `Explore`, `Plan`, `general-purpose`)                                                                |
| `hooks`                    | No          | Hooks scoped to this skill's lifecycle                                                                                                                             |

## Invocation Types

Two frontmatter fields control who can invoke a skill:

| Frontmatter                      | You can invoke | Claude can invoke | Best for                                                              |
| -------------------------------- | -------------- | ----------------- | --------------------------------------------------------------------- |
| (default)                        | Yes            | Yes               | General-purpose utilities                                             |
| `disable-model-invocation: true` | Yes            | No                | Expensive or disruptive operations. deploy, commit, send messages     |
| `user-invocable: false`          | No             | Yes               | Background knowledge. conventions, domain context, legacy system docs |

## Arguments and Substitutions

Skills support arguments via the `$ARGUMENTS` placeholder. When you run `/fix-issue 123`, `$ARGUMENTS` is replaced with `123`.

| Variable                | Description                                  |
| ----------------------- | -------------------------------------------- |
| `$ARGUMENTS`            | All arguments passed when invoking the skill |
| `$ARGUMENTS[N]` or `$N` | A specific argument by position (0-based)    |
| `${CLAUDE_SESSION_ID}`  | The current session ID                       |

For dynamic context, use the `` !`command` `` syntax to run shell commands before the skill content is sent to Claude. the output replaces the placeholder.

## Installation

```bash
# Project-specific (available when working in this repo)
mkdir -p .claude/skills
cp -r /path/to/my-skill .claude/skills/my-skill

# Or global (available across all projects)
cp -r /path/to/my-skill ~/.claude/skills/my-skill
```

## When to Create a Skill

Good candidates:

- **Repetitive multi-step workflows** you run more than twice a week
- **Scaffolding tasks** that create the same file structure each time
- **Analysis patterns** you apply across different repos
- **Background knowledge**. conventions, domain context, API patterns Claude should always know

Poor candidates:

- One-off tasks you'll never repeat
- Simple commands that are faster to type directly
- Tasks that vary significantly each time

## Further Reading

- [Official Claude Code skills documentation](https://code.claude.com/docs/en/skills)
- [What is a CLAUDE.md?](what-is-a-claude-md.md). how skills and CLAUDE.md files complement each other
