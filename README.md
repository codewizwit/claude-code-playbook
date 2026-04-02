# claude & i

A complete Claude Code environment. 33 agents, 4 skills, 12 role-based standards. Fork it, run the setup wizard, and make it yours.

[![Live Site](https://img.shields.io/badge/live_site-claude_%26_i-7c3aed?style=for-the-badge)](https://claude-code-playbook-sigma.vercel.app) [![GitHub](https://img.shields.io/badge/github-codewizwit-18181b?style=for-the-badge&logo=github)](https://github.com/codewizwit/claude-and-i)

## Quick Start

```bash
gh repo fork codewizwit/claude-and-i --clone
cd claude-and-i
claude
/setup
```

The `/setup` wizard walks you through picking agents, skills, and a standard, then installs everything to `~/.claude/`.

Need Node.js or Claude Code first? See the [full setup guide](src/content/docs/getting-started.md).

## What's Inside

### Agents

33 specialized assistants in four categories.

| Category    | Agents                                                                                                                                                                  |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Work**    | Architect, Builder, Researcher, Reviewer, Debugger, Refactorer, Branding, Business Analyst, Project Planner, Proposal Writer, Behavioral Interview, Technical Interview |
| **Meta**    | Agent Architect, Skill Architect, Hook Architect                                                                                                                        |
| **Utility** | Codebase Explainer, Test Generator, API Documenter, Migration Guide, AI Auditor, E2E Strategist, Creative Thinker, Debate Partner, Doc Writer                           |
| **Fun**     | Philosopher, Sci-Fi, Anime Buddy, Music Buddy, Storyteller, Rubber Duck, Snoop Dogg, Steve Jobs, Trivia Host                                                            |

Each agent is a markdown file in `agents/`. Browse them on the site or read them directly.

### Skills

4 interactive skills that run inside Claude Code.

| Skill             | What it does                                                 |
| ----------------- | ------------------------------------------------------------ |
| `/setup`          | Interactive wizard to pick your standard, agents, and skills |
| `/init-claude-md` | Generate a CLAUDE.md for your project                        |
| `/repo-skills`    | Discover and install skills from the repo                    |
| `/skill-scout`    | Find community skills                                        |

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
