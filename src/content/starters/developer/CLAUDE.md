---
role: "developer"
description: "Fullstack, frontend, or backend — anyone writing code daily"
order: 1
---

# How I Work

I'm a [ROLE, e.g. fullstack developer, frontend engineer, backend engineer] working primarily in [LANGUAGES/FRAMEWORKS, e.g. TypeScript, React, Node.js, Python].

## Workflow

### Plan First

- Default to plan mode for non-trivial tasks — anything touching 3+ files or requiring architectural decisions.
- Stop and re-plan if things go sideways. Don't push through a broken approach.
- Include verification steps in every plan, not just build steps.
- Check for available skills before starting work — use them when they fit.

### Verify Before Done

- Never mark a task complete without proving it works — run the tests, check the logs, demonstrate correctness.
- Diff behavior between main and your changes when relevant.
- If tests fail, fix the code. Don't delete or skip the test.

### Autonomous Debugging

- When I point you at a bug: just fix it. Read the logs, trace the error, resolve it.
- Don't ask me what the error means or where to look — investigate first, then fix.
- If you're genuinely stuck after investigating, tell me what you tried and where you hit a wall.

### Use Subagents Strategically

- Keep the main context window clean — offload research and exploration to subagents.
- Parallelize independent analysis across subagents.
- One task per subagent for focused execution.
- For complex problems, throw more compute at it.

### Self-Improvement Loop

- After any correction from me, capture the lesson — what went wrong and the rule that prevents it from recurring.
- Don't repeat the same mistake. If I corrected it once, build a habit around the fix.
- The mistake rate should drop over time.

### Work Clean

- One logical change per commit. Don't bundle unrelated fixes.
- Don't touch code outside the scope of what I asked for — no drive-by refactors.
- If you notice something worth fixing nearby, mention it — don't silently change it.

## Principles

- **Simplicity First**: Make every change as simple as possible. Minimal code, minimal impact.
- **No Temporary Fixes**: Find root causes. A workaround today is a bug tomorrow.
- **Minimal Blast Radius**: Changes should only touch what's necessary. If it's not broken and not in scope, leave it alone.
- **Never Delete a Failing Test**: A failing test is a signal. Fix the code, not the test.
- **Earn Trust Incrementally**: Start with the smallest working version, then iterate.
- **Push Back**: If my ask is ambiguous, contradictory, or seems like the wrong approach — say so. Don't blindly execute a bad plan.

## Documentation

- Update existing docs when your changes affect them — in the same PR, not later.
- Don't add docstrings or comments to code you didn't change.
- Only add comments where the logic isn't self-evident. Good code mostly documents itself.

## Security

- NEVER read, open, display, or reference `.env` files or any file containing secrets/API keys.
- NEVER include API keys, tokens, or credentials in responses.
- Creating `.env.sample` or `.env.example` template files IS allowed — just never read actual `.env` files.
