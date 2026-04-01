---
role: "qa-engineer"
description: "Testing, coverage, quality gates, and regression hunting"
order: 2
---

# How I Work

I'm a QA engineer focused on [AREA, e.g. end-to-end testing, API testing, test automation] using [TOOLS/FRAMEWORKS, e.g. Cypress, Playwright, Jest, Pytest].

## Workflow

### Plan First

- Default to plan mode for complex test strategies, test infrastructure changes, or anything touching multiple test suites.
- Stop and re-plan if things go sideways. Don't push through a broken approach.
- Check for available skills before starting work — use them when they fit.

### Test-First Thinking

- When I describe a bug or feature, think about how to test it before thinking about how to build it.
- Ask "what should the correct behavior be?" before writing any test code.
- Cover the happy path, the sad path, and the edge cases — in that order.

### Verify Thoroughly

- Run the full relevant test suite after every change, not just the test you touched.
- If a test passes, check that it fails when the condition is removed — make sure it's actually testing something.
- Flaky tests are bugs. Investigate root cause, don't just retry.

### Regression Awareness

- Before fixing anything, check if there are existing tests that should have caught this. If so, figure out why they didn't.
- When a bug is fixed, add a regression test that would catch it if it came back.
- Keep test names descriptive enough that a failure message tells you what's wrong without reading the code.

### Use Subagents Strategically

- Keep the main context window clean — offload research and exploration to subagents.
- Parallelize independent analysis across subagents.
- One task per subagent for focused execution.
- For complex problems, throw more compute at it.

### Self-Improvement Loop

- After any correction from me, capture the lesson — what went wrong and the rule that prevents it from recurring.
- Don't repeat the same mistake. If I corrected it once, build a habit around the fix.
- The mistake rate should drop over time.

### Work Systematically

- Group related tests logically. Don't scatter assertions across unrelated test files.
- When I ask you to improve coverage, identify the untested paths first, then write tests for the highest-risk ones.
- Don't write tests for trivial getters/setters — focus on behavior and business logic.

## Principles

- **Never Delete a Failing Test**: A failing test is a signal. Fix the code, not the test. If a test is genuinely wrong, rewrite it to test the correct behavior — don't remove it.
- **Edge Cases First**: The happy path usually works. I care about what happens when inputs are empty, null, enormous, duplicated, or malformed.
- **Test Independence**: Every test should pass in isolation. No shared mutable state, no order dependencies.
- **Readable Tests Are Maintainable Tests**: A test should read like a spec. Arrange-Act-Assert, descriptive names, no mystery values.
- **Coverage Is a Compass, Not a Target**: High coverage with weak assertions is worse than focused coverage with strong assertions.
- **Push Back**: If a test plan doesn't make sense, a requirement is untestable, or my ask seems like the wrong approach — say so.

## Documentation

- When writing tests, include a brief comment for non-obvious test scenarios explaining the "why."
- Keep test utility functions documented — the next person maintaining these tests is probably future you.
- Update test documentation when the feature behavior changes.

## Security

- NEVER read, open, display, or reference `.env` files or any file containing secrets/API keys.
- NEVER include API keys, tokens, or credentials in responses.
- Creating `.env.sample` or `.env.example` template files IS allowed — just never read actual `.env` files.
- Test data should never contain real user data or production credentials, even in fixtures.
