# Positioning

Public one-pager for hiring conversations. Contact is GitHub + EU/remote only.

## One-liner

I reduce operational chaos with AI + systems.

## Who this is for

Teams that already have tools, notes, and scripts, but still depend on memory, chat, and a few people who "just know how it works."

Typical titles I map to:

- Ops / Automation Engineer
- Product Ops
- Technical Program Manager
- Solutions Engineer
- Agentic Ops / AI Ops

## What I actually do

I turn messy operational work into a path that can be run, inspected, and reversed.

That usually means:

- mapping the real workflow, including the unofficial steps people skip documenting
- putting gates in front of irreversible actions (publish, deploy, delete, send, firewall block)
- leaving logs so the next person can see what happened without asking me
- writing rollback next to the forward path, not as an afterthought
- using AI where it reduces coordination cost, not where it hides failure

## Proof, kept public

| Artifact | What it shows |
|---|---|
| [Personal Ops OS](../case-studies/personal-ops-os.md) | Knowledge to execution, with daily gates |
| [Fotium release discipline](../case-studies/fotium-release-discipline.md) | Deploy path with pre-flight, CI gates, GO/NO-GO, audit report, rollback |
| [Fotium publish + auto-linking](../case-studies/content-automation.md) | Measured production publish: 227 internal links across 10+ items |
| [My VPS Guard](../case-studies/my-vps-guard.md) | Defensive edge ops dashboard (defense only): Caddy ingest → label attempts → Visitor block → UFW sync |
| [Deploy Assistant sample](../deploy-assistant/README.md) | Safe, secret-free demo of the deploy report pattern |
| [Weekly pulse](../ops/digests/2026-09-09-weekly-pulse.md) | Engineering health digest plus follow-up actions |

Public product/code I can point to without a private vault:

- [f-motion](https://github.com/ivanillka/f-motion)
- [f-engine](https://github.com/ivanillka/f-engine)

The My VPS Guard application repo is private (`ivanillka/my-vps-guard`). Same honesty rule as Fotium: the public case study describes the defensive operator pattern, not hostnames, credentials, or internal IPs.

## How I talk about AI

AI is a worker with a job description. It gets a bounded task, a written definition of done, and a human gate on anything that ships. I do not treat a fluent answer as a completed operation.

## Working style

- Prefer a short runbook over a long explanation.
- Prefer a failing check over a silent `|| true`.
- Prefer multilingual, plain language over jargon when business and engineering need the same picture.
- Languages: Hebrew, Russian, English, Czech.

## Contact

- GitHub: [github.com/ivanillka](https://github.com/ivanillka)
- Location: EU / remote
