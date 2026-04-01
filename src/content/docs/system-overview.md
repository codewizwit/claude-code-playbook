---
title: "System Overview"
order: 5
---

How all the pieces fit together. Three layers, all markdown, all editable.

---

## The Three Layers

**Agents** are specialized assistants. Each one has a model, a set of tools it can access, and a system prompt that defines how it works. You can delegate tasks to them by name (`@architect`, `@debugger`) or Claude will route to them automatically based on what you're doing.

**Skills** are knowledge packets that activate based on context. Edit a `.prisma` file and the database skill loads. Ask about testing and testing patterns appear. You never invoke them manually.

**Standards** are role-based CLAUDE.md files. They define your working preferences, guardrails, and conventions. Pick one, copy it, fill in the blanks. Active every session.

---

## How They Work Together

1. Your **standard** sets the baseline. How you like to work, what to avoid, what matters.
2. **Agents** handle specialized tasks. Architect thinks, Builder codes, Reviewer checks quality.
3. **Skills** inject the right knowledge at the right moment. Framework patterns, testing conventions, documentation rules.

You can use any layer independently. A standard alone is valuable. Adding agents makes you faster. Skills fill in the gaps automatically.

---

## Agents

21 agents across four categories.

| Category | Count | Examples                                                                                        |
| -------- | ----- | ----------------------------------------------------------------------------------------------- |
| Work     | 6     | Architect, Builder, Researcher, Reviewer, Debugger, Refactorer                                  |
| Meta     | 3     | Agent Architect, Skill Architect, Hook Architect                                                |
| Utility  | 6     | Codebase Explainer, Test Generator, API Documenter, Migration Guide, AI Auditor, E2E Strategist |
| Fun      | 6     | Philosopher, Sci-Fi, Anime Buddy, Music Buddy, Storyteller, Rubber Duck                         |

Each agent is one markdown file in `~/.claude/agents/`. Browse them all on the [Agents](/agents) page.

---

## Skills

27 skills across categories like Framework, Language, Database, AI, Testing, Standards, and Workflow.

Skills define when they should fire using file patterns, import detection, and prompt keywords. Claude Code handles the matching. You just work normally and the right context appears.

Browse them all on the [Skills](/skills) page.

---

## Standards

12 role-based CLAUDE.md files covering technical and non-technical roles: Developer, QA Engineer, Data Engineer, Tech Lead, Product Owner, Manager, DevOps Engineer, Design Engineer, Educator, Consultant, Analyst, AI Engineer.

Each one is a real CLAUDE.md you can copy and customize. Browse them on the [Standards](/standards) page.

---

## Getting Started

The fastest way to set up your environment:

```
gh repo fork codewizwit/claude-code-playbook --clone
cd claude-code-playbook
claude
/setup
```

The `/setup` wizard walks you through picking agents, skills, and a standard, then installs everything to `~/.claude/`.

---

## File Structure

Everything lives in `~/.claude/` as plain files.

```
~/.claude/
├── CLAUDE.md              Your standard (working preferences)
├── settings.json          Permissions, hooks, plugins
├── agents/                One markdown file per agent
│   ├── architect.md
│   ├── builder.md
│   └── ...
└── skills/                One directory per skill
    ├── typescript-expert/
    │   └── SKILL.md
    └── ...
```

All readable. All editable. All version-controllable.
