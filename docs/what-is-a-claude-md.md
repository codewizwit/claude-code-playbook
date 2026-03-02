# What Is a CLAUDE.md?

A CLAUDE.md is a markdown file that shapes how Claude Code behaves when it works with you. It's loaded into context at the start of every session, so the preferences, standards, and guardrails you define become part of how Claude thinks and responds.

It's not documentation. It's not a config file. It's a **working agreement** — the same way you'd onboard a new teammate by telling them how you like to work, what matters to you, and what to avoid.

## Why It Matters

Without a CLAUDE.md, Claude Code uses sensible defaults. With one, it follows *your* defaults:

- **Consistency**: Claude applies your coding standards, commit conventions, and workflow preferences without being reminded every session.
- **Fewer review cycles**: When Claude knows your patterns upfront, the first draft is closer to what you'd actually approve.
- **Guardrails**: Rules like "never touch `.env` files" or "don't delete failing tests" are enforced automatically.
- **Onboarding**: New team members can read the CLAUDE.md to understand the team's working norms — it doubles as a lightweight engineering standards doc.
- **Reduced repetition**: Preferences you'd otherwise repeat every conversation ("use plan mode first", "write tests before code") are stated once and always applied.

## The Three Levels

CLAUDE.md files stack. You can have up to three levels, and all of them are loaded together:

### 1. User-level: `~/.claude/CLAUDE.md`

Your personal preferences that apply across every project. This is where you put things like:
- Your role and primary tech stack
- Workflow habits (plan first, verify before done, etc.)
- Communication preferences
- Security rules (never read .env files)

### 2. Project-level: `./CLAUDE.md`

Lives in the root of a repo. Applies to everyone working on that project with Claude Code. Good for:
- Project-specific coding standards
- Architecture decisions and patterns to follow
- Test conventions
- Dependencies and tools used in this repo

### 3. Folder-level: `src/CLAUDE.md`, `tests/CLAUDE.md`, etc.

Scoped to a specific directory within a project. Useful for:
- Module-specific patterns ("all components in this directory use X pattern")
- Test-specific rules ("integration tests in this folder require a running database")
- API-specific conventions ("all endpoints follow this response format")

When multiple levels exist, they're combined — user-level applies first, then project-level adds to it, then folder-level adds further specificity. More specific levels can override more general ones.

## What Makes a Good CLAUDE.md

**Be specific.** "Write clean code" means nothing. "No function longer than 30 lines" means something. "Use plan mode for tasks touching 3+ files" is actionable. The more concrete your rules, the better Claude follows them.

**Write it like preferences.** "I want..." and "When I ask..." work better than formal specification language. You're telling a teammate how you like to work, not writing a legal contract.

**Start minimal.** Use a starter template for a week before customizing heavily. Add rules based on what you actually need, not what you think you might need. A 20-line CLAUDE.md that's all signal beats an 80-line one with filler.

**Iterate over time.** Every time Claude does something you don't like, add a rule. Every time you repeat yourself across sessions, capture it. A good CLAUDE.md is a living document that gets sharper with use.

**Keep it under 80 lines.** Longer files dilute the signal. If you need more, split project-specific rules into a project-level CLAUDE.md and keep your personal one focused.

## Further Reading

- [Claude Code documentation on CLAUDE.md](https://docs.anthropic.com/en/docs/claude-code/claude-md)
- [What is a skill?](what-is-a-skill.md) — reusable prompts that complement your CLAUDE.md
