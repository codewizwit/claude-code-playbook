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
gh repo fork codewizwit/claude-and-i --clone
cd claude-and-i
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

## Step 5: Make It Yours

This is the most important step. The setup wizard gives you a working baseline, but a generic environment serves everyone the same way, which means it serves no one particularly well. The whole point is to shape this around how you actually work.

- Open `~/.claude/CLAUDE.md` and replace the `[PLACEHOLDER]` values with your specifics
- Or just tell Claude: "Let's customize my CLAUDE.md" and have a conversation about how you work

Things worth personalizing:

- Your tech stack and tools
- Team conventions and communication channels
- What Claude should always ask before doing (push, deploy, delete)
- What Claude should never touch (specific files, directories)
- How you like to think through problems (plan first? dive in? whiteboard with diagrams?)
- What kind of feedback helps you vs. what feels like noise

A senior architect and a first-time coder shouldn't get the same experience. A data engineer and a product manager shouldn't get the same guardrails. The specificity is what makes this useful. Keep iterating on it. Every time Claude does something you don't like, add a rule. Every time you repeat yourself, capture the pattern. Your environment should get sharper over time, not stay static.

## What Got Installed

Three things, all in `~/.claude/`:

1. **CLAUDE.md** : Your working standard. Loaded every session. Defines your role, preferences, and guardrails.
2. **agents/** : Specialized assistants. Try `@architect` or `@researcher` in your next session.
3. **skills/** : Auto-injected knowledge. These activate based on what files you're editing and what you're asking about.

## Next Steps

- **Use Claude Code normally.** Your configuration is active. Claude follows your preferences automatically.
- **Iterate.** If Claude does something you don't like, tell it to add a rule. Your CLAUDE.md gets sharper over time.
- **Build more.** Use `@agent-architect` to create new agents and `@skill-architect` to create new skills. Build agents for problems only you have. That's where the real value lives.
- **Share what you learn.** If you build an agent or skill that solves a real problem, share it. The next person with that problem shouldn't have to start from scratch. That's how we make sure no one gets left behind.
- **Explore the docs:**
  - [What is a CLAUDE.md?](/docs/what-is-a-claude-md)
  - [What is a skill?](/docs/what-is-a-skill)
  - [settings.json tips](/docs/settings-json-tips)
  - [System overview](/docs/system-overview)
