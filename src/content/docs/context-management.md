---
title: "Context Management"
order: 8
---

Claude Code has a context window. Everything in the conversation, tool results, injected skills, and file contents compete for space. Managing context well means better results and fewer wasted turns.

## How Context Gets Used

| Source               | Size                      | You Control It?                                |
| -------------------- | ------------------------- | ---------------------------------------------- |
| Your CLAUDE.md       | ~2K tokens                | Yes. Keep it under 100 lines.                  |
| Conversation history | Grows per turn            | Partially. Start new sessions for new tasks.   |
| File reads           | Varies                    | Yes. Read specific sections, not entire files. |
| Skill injections     | ~4K each, max 3 per event | Indirectly. Skills fire based on your work.    |
| Agent system prompts | ~1-3K each                | Yes. Agents run in isolated context.           |

## Keep Your CLAUDE.md Lean

The sweet spot is 30-100 lines. Beyond 200, content gets truncated. If your CLAUDE.md is growing:

- Extract multi-step processes into skills
- Move project-specific rules into project-level CLAUDE.md files
- Delete rules you added reactively but no longer need

## Start New Sessions for New Tasks

Context accumulates. A session that started with "fix the login bug" and evolved into "now refactor the auth system" carries all the old tool results, file reads, and conversation turns from the bug fix. Starting fresh gives Claude a clean slate.

Good reasons to start a new session:

- Switching to a different feature or area of the codebase
- After a long debugging session (stale context from dead ends)
- When Claude starts referencing things from earlier that are no longer relevant

## Use Agents to Protect Context

Agents run in their own context window. When you delegate to `@researcher`, the research results come back as a summary, not as raw file contents. This keeps your main conversation clean.

Use agents for:

- Exploring unfamiliar code (researcher returns a summary, not 20 file reads)
- Generating documentation (doc-writer works in isolation, delivers the result)
- Code review (reviewer reads everything in its own context, reports findings)

## Read Specific Sections

Instead of: "Read the entire auth module."
Try: "Read app/api/auth/route.ts, specifically the login handler."

Claude can read specific line ranges. Point it at what matters.

## Compact When Needed

Claude Code automatically compacts context when it gets large. This summarizes earlier conversation turns to free up space. It's usually fine, but if you notice Claude forgetting earlier decisions:

- Restate the important context in your next message
- Or start a new session with the key decisions listed upfront

## The Context Budget

Think of context like a budget:

- **Cheap:** short messages, specific file reads, agent delegations
- **Expensive:** "read all files in src/", long back-and-forth debugging, large paste-ins

The goal is to keep the most relevant information in context while letting stale information compact naturally. Skills help by injecting knowledge just-in-time instead of loading everything upfront.
