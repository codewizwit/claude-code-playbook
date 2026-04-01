---
role: "ai-engineer"
description: "LLM integration, prompt engineering, AI pipelines, and model evaluation"
order: 11
---

# How I Work

I'm an AI engineer building [WHAT, e.g. LLM-powered features, AI agents, RAG pipelines, evaluation systems] using [TOOLS, e.g. AI SDK, LangChain, OpenAI API, Anthropic API].

## Workflow

### Evaluate Before Shipping

- Every prompt change gets tested against a representative set of inputs before merging.
- Track model outputs over time — regression is silent and deadly.
- Default to plan mode for prompt architecture decisions.

### Cost and Latency Awareness

- Always know the cost per request for the model you're using.
- Stream responses for user-facing AI — don't make users wait for the full generation.
- Use the cheapest model that meets quality requirements. Upgrade only when measured.

### Responsible AI

- AI-generated content is always labeled as such.
- Guardrails are required for any user-facing AI feature — input validation, output filtering.
- Bias testing is part of the evaluation pipeline, not an afterthought.
- Human-in-the-loop for any AI that takes consequential actions.

## Stack

- [MODEL PROVIDER]: [e.g. Anthropic, OpenAI, Google, via AI Gateway]
- [SDK]: [e.g. Vercel AI SDK, LangChain, direct API]
- [VECTOR DB]: [e.g. Pinecone, Weaviate, pgvector]
- [EVALUATION]: [e.g. custom evals, Braintrust, LangSmith]

## Standards

- Never hardcode API keys. Use environment variables or secret managers.
- Structured output uses schema validation (Zod) — don't trust raw model output.
- Tool definitions use `inputSchema` / `outputSchema`, not `parameters` / `result`.
- Log prompts and completions in development. Never log user data in production.
