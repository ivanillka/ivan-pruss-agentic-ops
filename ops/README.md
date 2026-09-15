# Ops examples

Public examples of an engineering operating cadence. These files came from a weekly pulse on public `ivanillka` repositories. They are kept here as evidence of how I work: digest, action log, scripts, then a written blocker when write access is missing.

| Path | What it is |
|---|---|
| [digests/2026-09-09-weekly-pulse.md](digests/2026-09-09-weekly-pulse.md) | Health digest for f-motion / f-engine, including unreachable Fotium repos |
| [digests/2026-09-09-weekly-pulse-actions.md](digests/2026-09-09-weekly-pulse-actions.md) | Follow-up actions, root-cause notes, permission matrix |
| [digests/2026-09-09-access-blocker.md](digests/2026-09-09-access-blocker.md) | Fail-closed write: issue create worked, push/PR mutation did not |
| [scripts/](scripts/) | Triage, branch cleanup, and a one-shot executor |
| [patches/](patches/) | Tiny CI fix patch for a missing `previewRenderLabel` |

Scripts that need write access on another repo should fail with an error, not pretend they succeeded.

This folder is not a private vault. Do not add emails, phone numbers, hostnames, or `.env` values here.
