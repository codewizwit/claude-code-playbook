# What Is a Skill?

A skill is a reusable prompt — detailed instructions in a markdown file that tell Claude what to do, what tools to use, and when to activate. Instead of explaining the same multi-step process every session, you write it once as a skill and invoke it with a slash command.

## How It Works

A skill lives in a directory with a `SKILL.md` file:

```
~/.claude/skills/
└── my-skill/
    └── SKILL.md
```

The `SKILL.md` has two parts: **YAML frontmatter** (configuration) and a **markdown body** (instructions).

```yaml
---
name: my-skill
description: What this skill does in one sentence.
---
```

```markdown
# My Skill

Step-by-step instructions that Claude follows when this skill is invoked.
Use specific tool names and concrete actions — not vague guidance.
```

When invoked, Claude reads the full `SKILL.md` and follows the instructions as if you'd typed them into the conversation.

## Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Identifier used for invocation (e.g., `my-skill` for `/my-skill`) |
| `description` | Yes | One-line summary shown in skill listings |
| `disable-model-invocation` | No | If `true`, only the user can trigger it via `/name`. Claude won't auto-invoke it. Default: `false` |
| `allowed-tools` | No | Comma-separated list of tools the skill can use (e.g., `Read, Write, Glob, Grep, Bash`) |
| `argument-hint` | No | Hint shown to the user for expected arguments (e.g., `[file-path]`, `[component-name]`) |
| `context` | No | Set to `fork` to run in an isolated context that doesn't affect the main conversation |
| `agent` | No | Agent configuration for skills that spawn subagents |

## Invocation Types

Skills can be triggered in three ways:

- **User-only** (`disable-model-invocation: true`): Activated only when you type `/skill-name`. Best for expensive or disruptive operations you want explicit control over.
- **Claude-only**: Claude detects when the skill is relevant and applies it automatically. Best for coding standards and patterns that should always be enforced.
- **Both** (default): Either you or Claude can trigger it. Best for general-purpose utilities.

## Installation

Copy the skill directory into your Claude Code skills folder:

```bash
# Project-specific (available when working in this repo)
mkdir -p .claude/skills
cp -r /path/to/my-skill .claude/skills/my-skill

# Or global (available across all projects)
cp -r /path/to/my-skill ~/.claude/skills/my-skill
```

Skills in `.claude/skills/` within a repo are available when you work in that project. Skills in `~/.claude/skills/` are available globally across all projects.

## When to Create a Skill

Good candidates for skills:
- **Repetitive multi-step workflows** you run more than twice a week
- **Scaffolding tasks** that create the same file structure each time
- **Analysis patterns** you apply across different repos
- **Code review checklists** with specific criteria to evaluate

Poor candidates:
- One-off tasks you'll never repeat
- Simple commands that are faster to type directly
- Tasks that vary significantly each time

## Further Reading

- [Claude Code documentation on skills](https://docs.anthropic.com/en/docs/claude-code/skills)
- [What is a CLAUDE.md?](what-is-a-claude-md.md) — how skills and CLAUDE.md files complement each other
