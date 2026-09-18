# Fotium release / deploy discipline

From a remembered sequence to a gated path with an audit trail.

## Problem

Deploys were a manual, undocumented sequence. The steps lived with whoever last ran them.

That meant:

- no pre-flight, so missing secrets or a dirty tree showed up in production
- no lint / types / tests / Playwright / build gates on the deploy path itself
- no smoke check before calling it done
- no written GO / NO-GO
- no audit trail of which SHA went out
- no rollback discipline sitting next to the forward command

Fotium is a publishing / media platform. The product stack, at a high level, is TypeScript and React on the client, an API, PostgreSQL, CI, and object storage behind a CDN. Partner and studio work around this product also shows up in the public [f-motion](https://github.com/ivanillka/f-motion) repository. Standalone Fotium application repos are not public, so this page describes the operating pattern rather than linking private code.

## Fix

I specified a Deploy Assistant style flow. The operator does not "just ship." The path is an operator contract:

| Step | What it proves |
|---|---|
| **Pre-flight** | Working tree, required tools, and that secrets are present as *names* in the environment. Values are never written into the report. |
| **Gates** | lint, types, tests, Playwright, and build must pass. A red gate is a NO-GO. Fail loud. Do not swallow a red check. |
| **Smoke** | Health or a known-good public check after the candidate is built. |
| **GO / NO-GO** | A human records the decision. Automation can recommend. It cannot shrug. |
| **Post-deploy verify** | Re-run smoke against the live target. If verify fails, stop and roll back. |
| **Audit report** | Markdown with timestamp, git SHA, gate results, decision, and the exact rollback command. |

The public, secret-free sample of that artifact lives in this repo:

- [Deploy Assistant](../deploy-assistant/README.md)
- [Report template](../deploy-assistant/report-template.md)
- [Example report](../deploy-assistant/example-report.md)

The sample runner records SKIP with a reason when this portfolio repo has no app toolchain. A production Fotium path does not treat a missing gate as a pass.

Public adjacent evidence, not a substitute for the private Fotium repo:

- f-motion CI `verify` runs lint, tests, build, Pages artifact checks, and Playwright web E2E before merge
- f-motion hosted deploy runbooks require smoke after deploy and describe rollback by promoting the last known-good deployment
- this repo's [weekly pulse](../ops/digests/2026-09-09-weekly-pulse.md) treats a red default-branch deploy as a P0, not as background noise

## Result

A gated deploy path that can complete in about 30 seconds once checks are warm, with timestamped reports and one-command rollback instructions.

The number is an operator-path timing for the gated sequence, not a claim about production traffic or customer SLAs. I am not publishing hostnames, IPs, or local machine paths.

What changed in practice:

- a deploy is a document, not a chat message
- a failure is visible in the report
- rollback is copied from the report, not reconstructed from memory

## Limits (kept honest)

- This is release discipline for a personal/production lab, not a 50-person engineering organization with a dedicated SRE rotation.
- The in-repo Deploy Assistant is a **sample contract**. It does not SSH, read `.env` files, or talk to a private host.
- Adjacent f-motion CI is public evidence of the same habit (fail closed, leave a trail). It is not the Fotium application repo.

## Why this matters for hiring

Release discipline is Product Ops with production consequences. I care about the path someone else can run at 11pm: gates, evidence, and a reverse command.

Related public pages:

- [Deploy Assistant sample](../deploy-assistant/README.md)
- [Fotium production publish](content-automation.md)
- [Weekly pulse](../ops/digests/2026-09-09-weekly-pulse.md)
- [Case study index](README.md)
- [Positioning](../docs/positioning.md)
