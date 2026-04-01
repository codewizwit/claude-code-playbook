---
name: init-claude-md
description: Analyze a project's tech stack, conventions, and patterns, then generate a tailored project-level CLAUDE.md — smarter than `claude init`.
disable-model-invocation: true
argument-hint: [output-path]
allowed-tools: Read, Write, Glob, Grep, Bash
---

# Init CLAUDE.md

Analyze this project and generate a tailored `CLAUDE.md` that captures the real conventions, patterns, and standards already in use. Unlike `claude init`, this skill reads the codebase first and writes rules based on evidence — not generic defaults.

If the user provided an `[output-path]`, write there. Otherwise write to `./CLAUDE.md` in the project root.

## Analysis Steps

### 1. Detect the Tech Stack

- Use `Glob` to identify languages and frameworks from file extensions, config files, and lock files.
- Check for: `package.json`, `tsconfig.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `Gemfile`, `pom.xml`, `build.gradle`, `composer.json`, `requirements.txt`, etc.
- Read the primary config file to extract: framework (React, Angular, Vue, Django, Rails, etc.), test runner, linter, formatter, build tool.
- Note the package manager: npm, yarn, pnpm, bun, pip, poetry, cargo, etc.

### 2. Discover Project Conventions

**Code Style**

- Check for linter configs (`.eslintrc`, `.prettierrc`, `ruff.toml`, `.rubocop.yml`, `golangci-lint`, etc.) and note which linter is in use. Don't restate linter rules in the CLAUDE.md — the linter enforces them already.
- Look at 3-5 source files to identify patterns: naming conventions, import ordering, module structure, export style.

**Test Patterns**

- Use `Glob` to find test files and identify the convention: co-located tests (`*.test.ts` next to source), separate test directory (`tests/`, `__tests__/`, `spec/`), or both.
- Read 1-2 test files to identify: test framework, assertion style, fixture patterns, setup/teardown conventions.
- Check for: test coverage config, E2E test setup, integration test directories.

**Project Structure**

- Map the top-level directory structure and identify the architectural pattern: monorepo, module-per-feature, layered (controllers/services/repositories), flat, etc.
- Check for workspace configs (`nx.json`, `turbo.json`, `lerna.json`, `pnpm-workspace.yaml`).
- Identify where new files should go — if there's a clear pattern, capture it.

**Git Conventions**

- Use `Bash` (read-only) to check:
  - `git log --oneline -20` — commit message style (conventional commits, prefixed, freeform).
  - Branch naming from `git branch -r --sort=-committerdate | head -10`.
  - Whether there's a `.github/` or CI config that enforces commit or PR conventions.

**CI/CD**

- Check for `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`, `Dockerfile`, `docker-compose.yml`.
- Note what the CI pipeline runs — tests, linting, type checking, builds — so the CLAUDE.md can reference the right commands.

**Existing Documentation**

- Check for an existing `CLAUDE.md`, `CONTRIBUTING.md`, `README.md`, `docs/` directory.
- If a `CLAUDE.md` already exists, read it and enhance it rather than replacing it. Note what's already covered.
- Extract relevant conventions from `CONTRIBUTING.md` if present.

### 3. Check for User-Level CLAUDE.md

- Read `~/.claude/CLAUDE.md` if it exists.
- Identify what's already covered at the user level (workflow preferences, security rules, general principles).
- The project CLAUDE.md should NOT duplicate user-level rules — only add project-specific conventions.

### 4. Generate the CLAUDE.md

Write a project-level CLAUDE.md that includes only what's specific to this project. Structure it as:

```markdown
# [Project Name]

[One-line description of what this project is.]

## Tech Stack

[Language, framework, key libraries, package manager, test runner — just the facts, as a short list.]

## Project Structure

[Brief description of the directory layout and where things go. Only include if there's a clear pattern worth documenting.]

## Conventions

[Specific, actionable rules derived from the codebase analysis. Each rule should be something Claude can follow without ambiguity.]

## Commands

[Common commands for building, testing, linting, etc. Only include commands that exist in the project.]

## Patterns

[Recurring patterns specific to this project — how to add a new endpoint, how tests are structured, how components are organized. Only include patterns that are genuinely consistent across the codebase.]
```

### 5. Present to the User

After writing the file, give the user:

1. A summary of what you found and what you included.
2. The reasoning behind each section — why you included it, what evidence supports it.
3. Ask if they want to walk through it together and adjust anything before finalizing.

## Guidelines

- **Be specific, not generic.** "Use TypeScript strict mode" is useless if `tsconfig.json` already enforces it. "New API routes go in `src/routes/` with a co-located `*.test.ts` file" is useful.
- **Don't duplicate linter rules.** If ESLint or Prettier handles it, reference the linter — don't restate its config.
- **Don't duplicate user-level rules.** If `~/.claude/CLAUDE.md` already covers it, don't repeat it in the project CLAUDE.md.
- **Aim for 30-100 lines.** The official sweet spot — beyond 200 lines content gets truncated. If the generated CLAUDE.md exceeds 100 lines, review it for content that would work better as a skill — multi-step processes, detailed patterns, or complex checklists should be extracted into `.claude/skills/` and referenced from the CLAUDE.md with a one-liner like "Run `/skill-name` for [task]." Present these as suggestions to the user: which sections to keep inline and which to extract into skills.
- **Evidence over assumption.** Every rule should be traceable to something found in the codebase. If you're guessing, leave it out.
- **Commands must be real.** Only include commands that actually exist in `package.json` scripts, `Makefile`, or equivalent. Verify before including.
- **If a CLAUDE.md already exists**, enhance it — don't replace it. Add missing sections, update outdated commands, flag contradictions.
- Use `Bash` only for read-only commands. Do not modify the repository (except writing the CLAUDE.md output).
