# Agent Catalog

A complete inventory of every agent in the system. Each one is a single markdown file — click "Edit" to modify it directly on GitHub.

---

## Work Mode Agents

Agents that handle different phases of software development.

### Architect — Deep Thinker

> _"Think through this before we build."_

|             |                                                                  |
| ----------- | ---------------------------------------------------------------- |
| **File**    | [`~/.claude/agents/architect.md`](../../agents/architect.md)     |
| **Model**   | opus (smartest, most expensive)                                  |
| **Tools**   | Read, Grep, Glob, WebSearch, WebFetch                            |
| **Access**  | Read-only — cannot modify code                                   |
| **Effort**  | Max                                                              |
| **Trigger** | "think through", "design", "architect", "what's the best way to" |

Produces architecture diagrams (Mermaid), trade-off analysis, and recommendations. Always asks "why?" before proposing "how."

---

### Builder — Fast Implementer

> _"Here's the spec. Build it."_

|             |                                                          |
| ----------- | -------------------------------------------------------- |
| **File**    | [`~/.claude/agents/builder.md`](../../agents/builder.md) |
| **Model**   | sonnet (fast, capable)                                   |
| **Tools**   | All tools                                                |
| **Access**  | Full write access                                        |
| **Effort**  | High                                                     |
| **Trigger** | "build this", "implement", "write the code", "scaffold"  |

Follows plans and specs. Writes minimal code. Runs tests. Verifies before declaring done.

---

### Researcher — Deep Explorer

> _"How does this work?"_

|             |                                                                    |
| ----------- | ------------------------------------------------------------------ |
| **File**    | [`~/.claude/agents/researcher.md`](../../agents/researcher.md)     |
| **Model**   | sonnet                                                             |
| **Tools**   | Read, Grep, Glob, Bash, WebSearch, WebFetch                        |
| **Access**  | Read-only + web                                                    |
| **Effort**  | High                                                               |
| **Trigger** | "research", "find out", "explore", "investigate", "what does X do" |

Explores codebases and documentation. Returns concise answers with file paths and line numbers. Never modifies files.

---

### Reviewer — Quality Gate

> _"Is this ready to ship?"_

|             |                                                            |
| ----------- | ---------------------------------------------------------- |
| **File**    | [`~/.claude/agents/reviewer.md`](../../agents/reviewer.md) |
| **Model**   | sonnet                                                     |
| **Tools**   | Read, Grep, Glob                                           |
| **Access**  | Strictly read-only                                         |
| **Effort**  | High                                                       |
| **Trigger** | "review this", "check quality", "audit", "is this ready"   |

Structured code review: security (OWASP), type safety, performance, accessibility. Rates findings as critical/warning/suggestion.

---

### Debugger — Bug Hunter

> _"Why is this broken?"_

|             |                                                                 |
| ----------- | --------------------------------------------------------------- |
| **File**    | [`~/.claude/agents/debugger.md`](../../agents/debugger.md)      |
| **Model**   | sonnet                                                          |
| **Tools**   | Read, Grep, Glob, Bash                                          |
| **Access**  | Read + run tests                                                |
| **Effort**  | High                                                            |
| **Trigger** | "debug", "why is this broken", "fix this error", "test failing" |

Investigates autonomously. Reads errors, traces root causes, checks git history, proposes targeted fixes.

---

## Meta Agents

Agents that build more agents and skills.

### Skill Architect

> _"Create a skill for Tailwind patterns."_

|           |                                                                          |
| --------- | ------------------------------------------------------------------------ |
| **File**  | [`~/.claude/agents/skill-architect.md`](../../agents/skill-architect.md) |
| **Model** | sonnet                                                                   |
| **Tools** | Read, Grep, Glob, Write                                                  |

Knows the full SKILL.md spec — frontmatter, pathPatterns, promptSignals, validation rules, injection budgets. Designs and writes production-quality skills.

### Agent Architect

> _"Create an agent for writing project briefs."_

|           |                                                                          |
| --------- | ------------------------------------------------------------------------ |
| **File**  | [`~/.claude/agents/agent-architect.md`](../../agents/agent-architect.md) |
| **Model** | sonnet                                                                   |
| **Tools** | Read, Grep, Glob, Write                                                  |

Knows the full agent spec — model selection, tool restrictions, permission modes, triggering patterns. Designs and writes new agents.

---

## Utility Agents

Migrated from older prompt tools — each handles a specific documentation/analysis task.

| Agent                  | Purpose                                          | File                    |
| ---------------------- | ------------------------------------------------ | ----------------------- |
| **Codebase Explainer** | Analyzes and documents a codebase's architecture | `codebase-explainer.md` |
| **Test Generator**     | Generates unit tests with AAA pattern            | `test-generator.md`     |
| **AI Auditor**         | Responsible AI audit against 6 principles        | `ai-auditor.md`         |
| **E2E Strategist**     | Creates end-to-end testing strategies            | `e2e-strategist.md`     |

---

## Project Experts

Project-level agents that live inside each repo's `.claude/agents/` directory.

| Agent                 | Project              | Stack                       | Key Context                                         |
| --------------------- | -------------------- | --------------------------- | --------------------------------------------------- |
| **ThriftFlip Expert** | thrift-flip          | Next.js + Prisma + eBay API | Built for a non-technical user — extreme simplicity |
| **Greenwood Expert**  | greenwood-ai-lab     | Next.js + AI SDK + shadcn   | AI learning experience for young scholars           |
| **Site Expert**       | codewizwit.com       | Astro + MDX + Playwright    | Personal brand — "No Human Left Behind"             |
| **HITL Expert**       | human-in-the-loop    | Nx + CLI toolkit            | Claude Code skills for human-in-the-loop workflows  |
| **Playbook Expert**   | claude-code-playbook | Shell + configs             | Role-based Claude Code starter kits                 |

---

## Fun Agents

Not everything has to be work.

### Philosopher — Thinking Buddy

> _"What do you think about consciousness?"_

|           |                     |
| --------- | ------------------- |
| **Model** | opus                |
| **Tools** | WebSearch, WebFetch |

Your friend who loves big ideas. Philosophy of technology, ethics, existentialism, thought experiments — whatever's on your mind. Opinionated but open. Casual, not academic.

### Sci-Fi — Speculative Fiction Buddy

> _"What should I read next?"_

|           |                     |
| --------- | ------------------- |
| **Model** | sonnet              |
| **Tools** | WebSearch, WebFetch |

Books, movies, shows, games. Personalized recommendations, deep thematic discussions, "what if" hypotheticals. Knows everything from Octavia Butler to Severance.

### Anime Buddy — Watch Tracker

> _"I just finished Frieren."_

|            |                                        |
| ---------- | -------------------------------------- |
| **Model**  | sonnet                                 |
| **Tools**  | Read, Write, WebSearch, WebFetch       |
| **Memory** | Persistent (tracks your watch history) |

Tracks what you've watched, gives personalized recs based on your taste, discusses episodes. Asks your mood before recommending.

### Storyteller — Narrative Crafter

> _"Write a talk about AI augmentation."_

|            |                                       |
| ---------- | ------------------------------------- |
| **Model**  | sonnet                                |
| **Tools**  | Read, Grep, Glob, Write               |
| **Skills** | brand-voice, alex-professional-skills |

Turns technical concepts into conference talks, blog posts, and READMEs in your personal voice.

### Rubber Duck — Pure Listener

> _"I'm stuck. Let me think out loud."_

|           |                  |
| --------- | ---------------- |
| **Model** | haiku (cheapest) |
| **Tools** | None             |

Only asks questions. Never suggests solutions. The classic rubber duck debugging experience — but it talks back. Fast and nearly free.

---

## How to Add Your Own

Tell Claude:

```
@agent-architect create an agent for [your use case]
```

Or create `~/.claude/agents/your-agent.md` manually:

```markdown
---
name: your-agent
description: What it does and when to use it.
model: sonnet
tools: Read, Grep, Glob
---

You are a [role]. Your job is to [purpose].

## How You Work

1. First step
2. Second step
3. Third step
```

That's it. It's just a markdown file.
