# Claude Code Playbook

Ready-to-use configuration for Claude Code — [CLAUDE.md starters](#claude-md-starters), [settings.json](#settings), and [skills](#skills) that work out of the box.

Clone the repo, pick your role, and start working. Everything in `.claude/` is active immediately.

**New to Claude Code?** Follow the [Getting Started](docs/getting-started.md) guide — no terminal experience needed.

## Quick Start

**1. Clone and open the repo**

```bash
git clone <repo-url> && cd claude-code-playbook
```

**2. Pick a starter and install it** (swap `developer` for your role)

```bash
cp starters/developer.md ~/.claude/CLAUDE.md
```

**3. Install settings + hooks**

```bash
cp .claude/settings.json ~/.claude/settings.json
```

```bash
mkdir -p ~/.claude/hooks && cp .claude/hooks/*.sh ~/.claude/hooks/ && chmod +x ~/.claude/hooks/*.sh
```

**4. Install skills globally** (optional — already active in this repo)

```bash
cp -r .claude/skills/skill-scout ~/.claude/skills/skill-scout
```

**5. Replace the `[PLACEHOLDER]` values** in your CLAUDE.md with your specifics, then start using Claude Code.

## What's in the Box

### CLAUDE.md Starters

A [CLAUDE.md](docs/what-is-a-claude-md.md) is your working agreement with Claude Code — your standards, preferences, and guardrails, applied every session. Pick the starter closest to your role, copy it, and customize the placeholders.

| Role | Who it's for | Starter |
|------|-------------|---------|
| **Developer** | Fullstack, frontend, backend — anyone writing code daily | [`starters/developer.md`](starters/developer.md) |
| **QA Engineer** | Testing, coverage, quality gates, regression hunting | [`starters/qa-engineer.md`](starters/qa-engineer.md) |
| **Data Engineer** | Pipelines, SQL, transformations, schema work | [`starters/data-engineer.md`](starters/data-engineer.md) |
| **Tech Lead** | Architecture, code review, setting team standards | [`starters/tech-lead.md`](starters/tech-lead.md) |
| **Product Owner** | Specs, research, docs — not writing code | [`starters/product-owner.md`](starters/product-owner.md) |
| **Manager** | Process, reports, planning — fully non-technical | [`starters/manager.md`](starters/manager.md) |

### Settings

The [`.claude/settings.json`](.claude/settings.json) controls permissions, tool access, and hooks. Unlike CLAUDE.md rules, deny rules in settings.json are enforced — they can't be talked around.

| Category | What it does |
|----------|-------------|
| **Deny rules** | Blocks reading `.env`, `.env.*`, AWS credentials, SSH keys |
| **Pre-approved commands** | npm run/install/npx, git add/commit/status/log/diff/branch/checkout/stash |
| **WebFetch allowlist** | `docs.anthropic.com`, `github.com` |
| **Ask rules** | Prompts before git push, git reset, rm |
| **Docs-check hook** | After `git commit`, nudges Claude if code changed but no docs were updated |
| **Skill-scout hook** | On context compact, nudges Claude to run `/skill-scout` and surface automation opportunities from the session |

See [settings.json tips](docs/settings-json-tips.md) for a full breakdown of each setting.

### Skills

[Skills](docs/what-is-a-skill.md) are reusable prompts — detailed instructions in markdown that Claude Code follows when invoked. Skills in `.claude/skills/` are active automatically in this repo.

| Skill | Command | What it does |
|-------|---------|-------------|
| **Skill Scout** | `/skill-scout` | Analyzes your codebase and session workflow for repetitive patterns. Also triggered automatically on context compact. |
| **Repo Skills** | `/repo-skills` | Analyzes git history, PR patterns, review comments, and branch conventions to find automatable repo operations. |

To use skills in other projects:

```bash
# Copy all skills to another project
cp -r .claude/skills/* /path/to/project/.claude/skills/

# Or install globally
cp -r .claude/skills/* ~/.claude/skills/
```

## Customization Tips

- **Start minimal.** Use the starter as-is for a week, then add rules based on what you actually need.
- **Be specific.** "Write clean code" means nothing. "No function longer than 30 lines" means something.
- **Write it like preferences, not documentation.** "I want..." and "When I ask..." work better than formal specs.
- **Layer it.** Put universal preferences in `~/.claude/CLAUDE.md` (global) and project-specific rules in `./CLAUDE.md` (per-repo). Both are loaded automatically.

## Learn More

- [What is a CLAUDE.md?](docs/what-is-a-claude-md.md) — how it works, the three levels, and what makes a good one
- [What is a skill?](docs/what-is-a-skill.md) — structure, frontmatter fields, invocation types, and when to create one
- [settings.json tips](docs/settings-json-tips.md) — deny .env files, allowlist docs for WebFetch, pre-approve common commands
- [Getting started](docs/getting-started.md) — visual walkthrough for non-technical users

## License

[MIT](LICENSE)
