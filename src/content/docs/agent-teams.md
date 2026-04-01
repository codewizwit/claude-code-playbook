---
title: "Agent Teams"
order: 6
---

Agent teams let multiple agents coordinate on a single task. A team lead delegates to specialists, each working in their own context.

## Enable It

Add to your `settings.json`:

```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

This is experimental. It enables the `TeamCreate` tool and `SendMessage` for inter-agent communication.

## How It Works

1. A **team lead** agent receives the task
2. The lead creates a team with `TeamCreate`, assigning specialized agents as members
3. Each member gets their own inbox and works in their own context
4. The lead sends tasks via `SendMessage` and collects results
5. The lead synthesizes everything into a final deliverable

## When to Use Teams

- Large tasks that span multiple areas (frontend + backend + tests)
- Tasks where different expertise is needed at different phases (architect plans, builder implements, reviewer checks)
- Parallel work where agents can operate independently then merge results

## Example Flow

```
You: "Build the user settings page with tests"

Team Lead:
  1. Sends to @architect: "Design the settings page data model and component structure"
  2. Waits for plan
  3. Sends to @builder: "Implement this plan: [architect's output]"
  4. Sends to @test-generator: "Write tests for the settings page"
  5. Sends to @reviewer: "Review the implementation"
  6. Synthesizes all feedback and delivers the result
```

## Team Configuration

Teams are configured per-project in `.claude/teams/` or created on the fly during a session. Each team has:

- A **lead agent** that coordinates
- **Member agents** with inboxes
- A **working directory** scoped to the project

## Related

- [settings.json](settings-json-tips) for permissions and environment variables
- [Hooks](hooks) for automated checks on tool events
- [Agents](/agents) for the full agent catalog
