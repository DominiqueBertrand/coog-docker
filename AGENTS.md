# Coog Docker Agent Instructions

## Scope

These instructions apply to agent work in `/coopengo/GITHUB/coog-docker/MASTER/coog-docker`, especially infrastructure, Docker, Tailscale, Traefik, monitoring, and service operations.

## Documentation First

- Before making infrastructure changes, load the relevant local Markdown documentation.
- Start with [README.md](/coopengo/GITHUB/coog-docker/MASTER/coog-docker/README.md).
- Do not rely on memory alone when the local repository documentation already describes the workflow.

## Documentation Maintenance

- When changing routes, ports, services, deployment steps, pairing flows, operational commands, or access patterns, update the corresponding Markdown documentation in the same task.
- Keep runbooks aligned with the real deployed behavior.
- If you discover a documented workflow is incomplete or wrong while fixing an issue, correct the documentation before finishing the task.
- Store shared TODOs, pending tasks, follow-ups, and future improvements in [TODO.md](/coopengo/GITHUB/coog-docker/MASTER/coog-docker/TODO.md).
- When you identify meaningful unfinished work during a task, add or update the corresponding entry in [TODO.md](/coopengo/GITHUB/coog-docker/MASTER/coog-docker/TODO.md) instead of leaving it only in transient conversation context.

## Infrastructure Workflow

- Prefer checking the existing local runbooks before searching elsewhere.
- Treat local Markdown files as the source of truth for this homelab unless direct inspection of the running system proves otherwise.
- When local docs and live behavior differ, fix the system or the docs, and clearly note which one was wrong.
