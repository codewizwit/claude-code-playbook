---
name: setup
description: "Interactive setup wizard — walks you through picking agents, skills, and a starter, then installs them to your Claude Code config."
user-invocable: true
---

# Setup Wizard

Walk the user through configuring their Claude Code environment from this playbook. Go section by section, let them pick what they want, then install everything at the end.

## Step 1: Welcome

Tell the user:

"Welcome to the Claude Code Playbook setup. I'll walk you through picking:

1. A role-based starter (your CLAUDE.md)
2. Which agents to install
3. Which skills to install

At the end, I'll copy everything to your ~/.claude/ directory. You can always re-run /setup to change your selections."

Check if ~/.claude/ exists. If not, create it.
Check if ~/.claude/CLAUDE.md already exists — if so, warn them that installing a starter will overwrite it, and ask if they want to back it up first.

## Step 2: Pick a Starter

Read the available starters from src/content/starters/. For each one, show:

- Role name
- One-line description

Ask the user to pick one. Show the first few lines of the CLAUDE.md as a preview if they want to see it before choosing.

Once they pick, note the selection but don't install yet.

## Step 3: Pick Agents

Read the available agents from src/content/agents/. Group them by type (work, meta, utility, fun) and present each group:

**Work Agents** — for different phases of development

- Architect (opus) — deep thinking, architecture, design
- Builder (sonnet) — fast code implementation
- etc.

**Meta Agents** — build more agents and skills

- Agent Architect, Skill Architect, Hook Architect

**Utility Agents** — documentation and analysis

- Codebase Explainer, Test Generator, etc.

**Fun Agents** — not everything has to be work

- Philosopher, Sci-Fi, Anime Buddy, etc.

For each group, ask: "Which of these do you want? (all / none / pick specific ones)"

Let them select individually or take the whole group. Note selections.

## Step 4: Pick Skills

Read the available skills from .claude/skills/ in this repo. Present them grouped by category:

- Framework: next-app-router, astro-site, vite-react-scaffold
- Language: typescript-expert
- Testing: testing-automation
- Standards: engineering-practices, accessibility-first, documentation-standards, code-documentation
- etc.

Same selection flow: "all / none / pick specific ones" per group.

## Step 5: Review and Install

Show a summary of everything they selected:

```
Starter: developer
Agents (8): architect, builder, researcher, reviewer, debugger, rubber-duck, ...
Skills (5): typescript-expert, next-app-router, testing-automation, ...
```

Ask: "Ready to install? This will copy files to ~/.claude/"

On confirmation, execute:

1. Copy the starter:

   ```bash
   cp src/content/starters/{role}/CLAUDE.md ~/.claude/CLAUDE.md
   ```

2. Create agents directory and copy selected agents:

   ```bash
   mkdir -p ~/.claude/agents
   ```

   For each selected agent, read the full agent .md file from the agents/ directory at the repo root (not src/content/) and copy it:

   ```bash
   cp agents/{name}.md ~/.claude/agents/
   ```

3. Create skills directories and copy selected skills:

   ```bash
   mkdir -p ~/.claude/skills/{name}
   ```

   Copy each selected skill's SKILL.md from .claude/skills/{name}/ in this repo.

4. Verify the install:
   - Count files in ~/.claude/agents/
   - Count directories in ~/.claude/skills/
   - Confirm CLAUDE.md exists

## Step 6: Done

Tell them:

"All set. Your Claude Code environment is configured with:

- Starter: {role}
- {N} agents installed
- {N} skills installed

Start a new Claude Code session to use your new setup. Try @architect or @researcher to test an agent.

Run /setup again anytime to add or change your selections."

## Rules

- Be conversational, not robotic. This is an onboarding experience.
- Don't dump all options at once. Go group by group.
- Let them preview any agent or skill before deciding.
- If they already have agents or skills installed, mention what's new vs. what they already have.
- Never overwrite existing files without asking first.
