---
title: "Plan, Execute, Iterate"
order: 9
---

The most effective way to work with Claude Code. Plan before building, break tasks down, execute in steps, iterate based on what you learn.

## Plan First

Never jump straight into code for non-trivial tasks. Start with a plan:

> "Let's plan first. I want to add user notifications. Read the current setup and propose an approach."

Claude enters plan mode, explores the codebase, and produces a structured plan you can review. This is where you catch wrong assumptions, missing requirements, and bad architectural choices. Fixing a plan takes seconds. Fixing an implementation takes an hour.

**When to plan:**

- Anything touching 3+ files
- New features that need design decisions
- Refactors that affect multiple modules
- Anything you'd whiteboard before coding

**When to skip planning:**

- One-line fixes
- Simple renames
- Adding a test for existing code

## Break It Down

Big tasks fail. Small tasks succeed. If a request would take you 30+ minutes to do manually, break it into pieces.

Instead of:

> "Build the entire settings page with profile editing, password change, notification preferences, and danger zone."

Try:

> "Let's build the settings page in steps. Start with the layout and navigation. We'll add each section after."

Then work through each piece:

1. Layout and routing
2. Profile section
3. Password section
4. Notification preferences
5. Danger zone
6. Tests

Each step is reviewable. Each step is revertible. Each step keeps context focused.

## Execute in Steps

Once the plan is approved, work through it sequentially:

1. **Do one thing.** Implement the first piece of the plan.
2. **Verify it works.** Run tests, check the output, confirm behavior.
3. **Move to the next.** Only after the current step is verified.

Don't let Claude batch multiple steps together. If step 2 fails, you want to know it was step 2, not somewhere in steps 2 through 5.

## Iterate

After executing, review what you built:

- **Does it match the plan?** If not, decide if the deviation was intentional or a drift.
- **Does it actually work?** Run it. Click through it. Not just "does it compile" but "does it behave correctly."
- **What's missing?** Edge cases, error states, loading states, empty states.

Then iterate:

> "The form works but doesn't show validation errors. Add inline error messages below each field."

Each iteration is small, specific, and verifiable.

## Use Agents in the Flow

The plan-execute-iterate loop maps naturally to agents:

1. **Plan:** `@architect` thinks through the approach, produces a diagram and spec
2. **Execute:** `@builder` implements the spec, runs tests
3. **Review:** `@reviewer` checks quality, security, accessibility
4. **Debug:** `@debugger` investigates if something breaks
5. **Iterate:** back to step 2 with feedback from the review

## When Things Go Sideways

If an implementation isn't working after 2-3 attempts:

1. **Stop.** Don't push through a broken approach.
2. **Re-plan.** The original plan may have been wrong.
3. **Start a new session.** Stale context from failed attempts makes things worse.

Restarting is not failure. It's recognizing that the context is polluted and a clean slate will be faster.

## The Checklist

Before marking anything done:

- [ ] Plan was reviewed before execution started
- [ ] Each step was verified independently
- [ ] Tests pass (or were written)
- [ ] The feature works end-to-end, not just in isolation
- [ ] Edge cases are handled (empty state, error state, loading state)
