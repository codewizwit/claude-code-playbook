---
title: "System Overview"
order: 10
---

How all the pieces fit together. Four layers, all markdown, all editable.

## The Four Layers

**Agents** are specialized assistants. Each one has a model, a set of tools, and a system prompt. Delegate by name (`@architect`, `@debugger`) or let Claude route automatically. [Browse agents](/agents)

**Skills** are knowledge packets that activate based on context. Edit a `.prisma` file and database patterns load. Ask about testing and testing conventions appear. [Browse skills](/skills)

**Standards** are role-based CLAUDE.md files. Working preferences, guardrails, and conventions. Pick a role, copy the file, customize. Active every session. [Browse standards](/standards)

**Settings and Hooks** control permissions and automation. Deny rules that can't be talked around, pre-approved commands, and hooks that fire on events like file saves and commits. [Read more](/docs/settings-json-tips)

## How They Work Together

1. Your **standard** sets the baseline. How you work, what to avoid, what matters.
2. **Settings** enforce guardrails. Deny rules, permission modes, agent teams.
3. **Agents** handle specialized tasks. Architect plans, Builder codes, Reviewer checks quality.
4. **Skills** inject knowledge just in time. Framework patterns, testing conventions, documentation rules.
5. **Hooks** automate checks. Format on save, block push to main, nudge when docs are stale.

Each layer is independent. A standard alone is valuable. Adding agents makes you faster. Skills fill gaps automatically. Hooks catch what you'd forget.

## Agents

33 agents across six categories.

| Category | Count | Examples                                                                                                                                               |
| -------- | ----- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Work     | 6     | Architect, Builder, Researcher, Reviewer, Debugger, Refactorer                                                                                         |
| Meta     | 3     | Agent Architect, Skill Architect, Hook Architect                                                                                                       |
| Utility  | 9     | Codebase Explainer, Test Generator, API Documenter, Migration Guide, Doc Writer, Behavioral Interview, Technical Interview, AI Auditor, E2E Strategist |
| Planning | 3     | Project Planner, Business Analyst, Proposal Writer                                                                                                     |
| Creative | 3     | Branding, Creative Thinker, Storyteller                                                                                                                |
| Fun      | 9     | Philosopher, Sci-Fi, Anime Buddy, Music Buddy, Rubber Duck, Steve Jobs, Snoop Claude, Debate Partner, Trivia Host                                      |

Each agent is one markdown file. [Browse the full catalog](/agents).

## Skills

4 interactive skills that run inside Claude Code: `/setup` (environment wizard), `/init-claude-md` (generate a CLAUDE.md), `/repo-skills` (discover and install skills), and `/skill-scout` (find community skills).

Skills are invoked as slash commands and walk you through interactive workflows. [Browse all skills](/skills).

## Standards

12 role-based CLAUDE.md files.

**Technical:** Developer, QA Engineer, Data Engineer, Tech Lead, DevOps Engineer, Design Engineer, AI Engineer.
**Non-Technical:** Product Owner, Manager, Educator, Consultant, Analyst.

Each one is a real CLAUDE.md you can copy and customize. [Browse standards](/standards).

## Settings and Hooks

Two hooks included out of the box:

- **Auto-format** on every file write (Prettier)
- **Block push to main** on any direct push attempt

Agent teams enabled via `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS`. [Read about hooks](/docs/hooks). [Read about agent teams](/docs/agent-teams).

## The Workflow

This environment is built around the [plan, execute, iterate](/docs/plan-execute-iterate) cycle:

1. **Plan** with `@architect` or plan mode. Design before building.
2. **Build** with `@builder`. One step at a time, verify each step.
3. **Review** with `@reviewer`. Quality check before shipping.
4. **Iterate** based on feedback. Small corrections, not rewrites.

For [good prompting](/docs/good-prompting) and [context management](/docs/context-management), see the dedicated guides.

## File Structure

Everything lives in `~/.claude/` as plain files.

```
~/.claude/
├── CLAUDE.md              Your standard
├── settings.json          Permissions, hooks, agent teams
├── agents/                One markdown file per agent
│   ├── architect.md
│   ├── builder.md
│   ├── reviewer.md
│   └── ...
└── skills/                One directory per skill
    ├── typescript-expert/
    │   └── SKILL.md
    ├── prisma-neon/
    │   └── SKILL.md
    └── ...
```

All readable. All editable. All version-controllable.

## Getting Started

```
gh repo fork codewizwit/claude-and-i --clone
cd claude-and-i
claude
/setup
```

The `/setup` wizard walks you through picking agents, skills, and a standard, then installs everything to `~/.claude/`.
