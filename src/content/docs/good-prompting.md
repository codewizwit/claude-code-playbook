---
title: "Good Prompting"
order: 7
---

How to get better results from Claude Code. Not a theory guide. Patterns that work in practice.

## Be Specific

Bad: "Fix the bug."
Good: "The login form submits but the page doesn't redirect. Check the auth handler in app/api/auth/route.ts."

Bad: "Make it better."
Good: "The dashboard loads slowly. Profile the data fetching in app/dashboard/page.tsx and suggest where to add caching."

Claude works best when you point it at the problem, not around it.

## Start With Context

Tell Claude what it's looking at before asking it to act:

- "This is a Next.js app with Prisma and Neon. The schema is in prisma/schema.prisma."
- "I'm working on the onboarding flow. The relevant files are in app/onboarding/."
- "This codebase uses the repository pattern. Services are in src/services/."

You can also use `@` to reference files directly: `@app/api/users/route.ts`

## One Task Per Message

Break complex requests into steps. Instead of:

> "Build a settings page with a form for updating email and password, add validation, write tests, and update the nav."

Try:

> "Let's build a settings page. Start by reading the existing layout and auth setup, then plan the approach."

Then follow up with each step after reviewing the plan.

## Use Plan Mode for Big Tasks

For anything touching 3+ files or requiring design decisions, start with planning:

> "Let's plan first. I want to add role-based access control. Read the current auth setup and propose an approach."

Claude will produce a plan you can review before any code gets written. Cheaper to fix a plan than to fix an implementation.

## Tell Claude What You Know

Share constraints and context that aren't in the code:

- "We're deploying to Vercel, so no long-running processes."
- "The team uses Playwright, not Cypress."
- "This needs to work without JavaScript for accessibility."
- "We're on a deadline. Prioritize working over elegant."

## Correct Early

If Claude starts down the wrong path, stop it immediately:

> "Stop. That's the wrong approach. We don't use Redux in this project. Use the existing context pattern in src/providers/."

Corrections early save time. Letting Claude finish a bad approach and then asking for a redo wastes both your time and context.

## Use Agents for Focus

Instead of asking Claude to do everything in one conversation, delegate to specialists:

- `@architect` for design decisions before building
- `@researcher` to understand unfamiliar code before modifying it
- `@reviewer` after implementing, before merging

Each agent has focused expertise and a restricted toolset that keeps it on track.

## What Not to Do

- Don't ask Claude to guess your stack. Tell it.
- Don't paste error messages without context. Include what you were doing when it happened.
- Don't ask "can you" questions. Just ask. "Can you add a test for this?" is slower than "Add a test for the login handler."
- Don't repeat instructions that are already in your CLAUDE.md. That's what standards are for.
