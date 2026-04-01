# Claude Code Playbook

A complete Claude Code environment. 21 agents, 27 skills, 12 role-based standards. Fork it, run the setup wizard, and make it yours.

## Quick Start

```bash
gh repo fork codewizwit/claude-code-playbook --clone
cd claude-code-playbook
claude
/setup
```

The `/setup` wizard walks you through picking agents, skills, and a standard, then installs everything to `~/.claude/`.

Need Node.js or Claude Code first? See the [full setup guide](src/content/docs/getting-started.md).

## What's Inside

### Agents

21 specialized assistants in four categories.

| Category    | Agents                                                                                          |
| ----------- | ----------------------------------------------------------------------------------------------- |
| **Work**    | Architect, Builder, Researcher, Reviewer, Debugger, Refactorer                                  |
| **Meta**    | Agent Architect, Skill Architect, Hook Architect                                                |
| **Utility** | Codebase Explainer, Test Generator, API Documenter, Migration Guide, AI Auditor, E2E Strategist |
| **Fun**     | Philosopher, Sci-Fi, Anime Buddy, Music Buddy, Storyteller, Rubber Duck                         |

Each agent is a markdown file in `agents/`. Browse them on the site or read them directly.

### Skills

27 auto-injected knowledge packets. They activate based on what files you're editing, what packages you're importing, and what you're asking about.

### Standards

12 role-based CLAUDE.md files: Developer, QA Engineer, Data Engineer, Tech Lead, Product Owner, Manager, DevOps Engineer, Design Engineer, Educator, Consultant, Analyst, AI Engineer.

Each one lives in its own directory as a real `CLAUDE.md` file you can copy and customize.

### Setup Wizard

The `/setup` skill runs an interactive walkthrough inside Claude Code. Pick your standard, agents, and skills. Everything gets copied to `~/.claude/`.

## Docs

- [Getting Started](src/content/docs/getting-started.md)
- [What is a CLAUDE.md?](src/content/docs/what-is-a-claude-md.md)
- [What is a Skill?](src/content/docs/what-is-a-skill.md)
- [settings.json Tips](src/content/docs/settings-json-tips.md)
- [System Overview](src/content/docs/system-overview.md)

## License

[MIT](LICENSE)
