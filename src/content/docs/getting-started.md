---
title: "Getting Started"
order: 1
---

Set up your Claude Code environment using this playbook. No terminal experience needed.

## What You Need

- A computer (Mac, Windows, or Linux)
- Node.js (18+)
- Claude Code
- About 10 minutes

## Step 1: Install Node.js

If you already have Node.js installed (`node --version` in terminal), skip to Step 2.

1. Download and install [Node.js](https://nodejs.org) (LTS version)
2. Open a terminal and verify: `node --version`

## Step 2: Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Verify it worked: `claude --version`

Optional: install the [Claude Code VS Code extension](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) for IDE integration.

## Step 3: Fork and Clone the Playbook

```bash
gh repo fork codewizwit/claude-code-playbook --clone
cd claude-code-playbook
```

Or fork it on GitHub first, then clone your fork.

## Step 4: Run the Setup Wizard

```bash
claude
```

Once Claude Code starts, run:

```
/setup
```

The wizard walks you through three choices:

1. **Pick a standard.** Choose the role closest to yours (Developer, Manager, Educator, etc.). This becomes your CLAUDE.md.
2. **Pick agents.** Browse by category (work, meta, utility, fun) and select the ones you want.
3. **Pick skills.** Same flow. Select by category, take all or pick specific ones.

The wizard copies your selections to `~/.claude/` and verifies the install.

## Step 5: Customize

After setup, your environment works out of the box. To customize:

- Open `~/.claude/CLAUDE.md` and replace the `[PLACEHOLDER]` values with your specifics
- Or just tell Claude: "Let's customize my CLAUDE.md" and have a conversation about how you work

Common things to customize:

- Your tech stack and tools
- Team conventions and communication channels
- What Claude should always ask before doing (push, deploy, delete)
- What Claude should never touch (specific files, directories)

## What Got Installed

Three things, all in `~/.claude/`:

1. **CLAUDE.md** : Your working standard. Loaded every session. Defines your role, preferences, and guardrails.
2. **agents/** : Specialized assistants. Try `@architect` or `@researcher` in your next session.
3. **skills/** : Auto-injected knowledge. These activate based on what files you're editing and what you're asking about.

## Next Steps

- **Use Claude Code normally.** Your configuration is active. Claude follows your preferences automatically.
- **Iterate.** If Claude does something you don't like, tell it to add a rule. Your CLAUDE.md gets sharper over time.
- **Build more.** Use `@agent-architect` to create new agents and `@skill-architect` to create new skills.
- **Explore the docs:**
  - [What is a CLAUDE.md?](what-is-a-claude-md.md)
  - [What is a skill?](what-is-a-skill.md)
  - [settings.json tips](settings-json-tips.md)
  - [System overview](system-overview.md)
