---
role: "data-engineer"
description: "Pipelines, SQL, transformations, and schema work"
order: 3
---

# How I Work

I'm a data engineer working with [STACK, e.g. Python, SQL, dbt, Spark, Airflow, BigQuery, Snowflake].

## Workflow

### Validate Before and After

- Before writing a transformation, understand the source data — shape, volume, nulls, edge cases.
- After every pipeline change, validate row counts, key uniqueness, and data types against expectations.
- "It ran without errors" is not validation. Show me proof the output data is correct.

### Idempotency by Default

- Every pipeline and transformation should be safe to re-run. No duplicates, no side effects.
- Use MERGE/upsert patterns instead of blind INSERTs where possible.
- If a step isn't idempotent, flag it clearly and explain why.

### Plan First

- For non-trivial pipeline changes, outline the approach before writing code — what sources, what transformations, what the output schema looks like.
- If a migration affects downstream consumers, map the dependencies before touching anything.
- Stop and re-plan if the data doesn't match expectations. Don't force bad data through a pipeline.
- Check for available skills before starting work — use them when they fit.

### Use Subagents Strategically

- Keep the main context window clean — offload research and exploration to subagents.
- Parallelize independent analysis across subagents.
- One task per subagent for focused execution.
- For complex problems, throw more compute at it.

### Self-Improvement Loop

- After any correction from me, capture the lesson — what went wrong and the rule that prevents it from recurring.
- Don't repeat the same mistake. If I corrected it once, build a habit around the fix.
- The mistake rate should drop over time.

### Work Incrementally

- Build and test one transformation step at a time. Don't chain five CTEs together and hope for the best.
- Use intermediate tables or temp views to validate each stage.
- When I ask for a query, start simple and iterate — don't write a 200-line query on the first attempt.

## Principles

- **Data Integrity Above All**: Correctness over speed. A fast pipeline that produces wrong numbers is worse than a slow one that's right.
- **No PII Exposure**: Never include, display, or log personally identifiable information. Mask, hash, or exclude it.
- **Schema Is a Contract**: Don't change column names, types, or remove fields without understanding who depends on them.
- **Nulls Are Not Zeros**: Handle NULL values explicitly. Don't let implicit coercion hide data quality issues.
- **Explain Your Joins**: Every JOIN should have a clear rationale. If a join changes row counts unexpectedly, stop and investigate — don't just add a DISTINCT.
- **Push Back**: If a data request doesn't make sense, the source data is suspect, or my approach seems wrong — say so. Don't blindly execute a bad pipeline.

## Documentation

- Document the business logic behind transformations, not just the SQL. Explain _why_ a filter exists, not just _that_ it does.
- Keep a column-level lineage comment for complex derived fields.
- When modifying an existing pipeline, update the data dictionary or schema docs in the same PR.

## Security

- NEVER read, open, display, or reference `.env` files or any file containing secrets/API keys.
- NEVER include API keys, tokens, connection strings, or credentials in responses.
- Creating `.env.sample` or `.env.example` template files IS allowed — just never read actual `.env` files.
- NEVER display, log, or include raw PII (names, emails, SSNs, etc.) in output or sample data.
