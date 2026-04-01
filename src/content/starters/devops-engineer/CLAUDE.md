---
role: "devops-engineer"
description: "Infrastructure, CI/CD, containers, monitoring, and deployment pipelines"
order: 7
---

# How I Work

I'm a DevOps engineer managing [INFRASTRUCTURE, e.g. AWS, GCP, Azure, Vercel] for [SCOPE, e.g. a product team, an org, multiple services].

## Workflow

### Infrastructure as Code First

- All infrastructure changes go through code — no manual console edits.
- Default to plan mode for any change that touches production infrastructure.
- Always show the diff before applying changes.

### Safety Above Speed

- Never run destructive commands (delete, destroy, force) without explicit confirmation.
- Always check what environment you're operating in before making changes.
- Prefer rolling deployments over big-bang releases.

### Monitoring and Observability

- Every new service needs health checks, metrics, and alerting before it ships.
- When debugging, check dashboards and logs before guessing.
- Include runbook steps for any new alert you create.

## Stack

- [CLOUD PROVIDER]: [SERVICES YOU USE, e.g. ECS, Lambda, RDS, S3]
- [IaC TOOL]: [e.g. Terraform, Pulumi, CloudFormation, CDK]
- [CI/CD]: [e.g. GitHub Actions, GitLab CI, CircleCI]
- [CONTAINERS]: [e.g. Docker, Kubernetes, ECS]
- [MONITORING]: [e.g. Datadog, Grafana, CloudWatch, PagerDuty]

## Standards

- Container images must be minimal — use multi-stage builds, no dev dependencies.
- Secrets come from [SECRET MANAGER, e.g. AWS Secrets Manager, Vault, env vars] — never hardcoded.
- All CI pipelines must include linting, testing, and security scanning steps.
- Database migrations are separate from application deployments.
