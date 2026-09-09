# Engineering Weekly Pulse — 2026-09-09

**Generated:** 2026-09-09 (cron, Sunday 07:00 UTC)  
**Scope:** f-motion, Fotium---candy, Fotium, f-engine  
**Repos checked:** [ivanillka/f-motion](https://github.com/ivanillka/f-motion), [ivanillka/f-engine](https://github.com/ivanillka/f-engine)

---

## Executive summary

| Repo | Status | Risk |
|------|--------|------|
| **f-motion** | Active — 12 open PRs, default-branch deploy failing | **High** |
| **f-engine** | Dormant — no PRs/CI since Jul 30 | **Medium** |
| **Fotium** | Not accessible to automation token | **Unknown** |
| **Fotium---candy** | Not accessible to automation token | **Unknown** |

**Top risks this week**

1. **f-motion default-branch deploy is red** — `deploy` workflow failed on merge of #22 (Sep 8) due to missing GitHub Actions secrets (`VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`). CI `verify` passed; only deploy broke.
2. **Draft PR backlog** — 11 open drafts, 4 with failing `verify` CI (#21, #20, #17, #10). Oldest untouched draft dates to Aug 6.
3. **Branch sprawl** — 43 remote branches on f-motion; ~20 `advisor/*` branches from Jul–Aug with no open PR (merge candidates for cleanup).
4. **Fotium repos unreachable** — `Fotium` and `Fotium---candy` not found under `ivanillka` and not visible to the installed GitHub App (token only sees `ivan-pruss-agentic-ops`). Cannot assess PR/CI/branch health.
5. **f-engine idle** — 41 days since last push; no open PRs, issues, or CI workflows.

---

## f-motion

**Default branch:** `advisor/133-design-contract` (pushed Sep 8)  
**URL:** https://github.com/ivanillka/f-motion

### Open PRs (12)

| # | Draft | CI | Last updated | Title |
|---|-------|----|--------------|-------|
| [24](https://github.com/ivanillka/f-motion/pull/24) | Yes | Pass | Sep 8 | Accept demo browser uploads so a local reel can attach media |
| [21](https://github.com/ivanillka/f-motion/pull/21) | Yes | **Fail** | Sep 3 | Fix f-motion.com hero image and fonts |
| [20](https://github.com/ivanillka/f-motion/pull/20) | Yes | **Fail** | Sep 3 | Run hosted f-motion.com on Hetzner, drop Fly.io |
| [18](https://github.com/ivanillka/f-motion/pull/18) | Yes | Pass | Aug 25 | FAL credit balance and footage-aware story from attached media |
| [17](https://github.com/ivanillka/f-motion/pull/17) | Yes | **Fail** | Aug 24 | Win11 baseline kit (updates, secure, light, creative-ready) |
| [16](https://github.com/ivanillka/f-motion/pull/16) | Yes | Pass | Aug 26 | Rebuild F-Motion as an honest OSS launch surface |
| [15](https://github.com/ivanillka/f-motion/pull/15) | Yes | Pass | Aug 21 | docs: refresh marketing homepage for shipped features |
| [14](https://github.com/ivanillka/f-motion/pull/14) | Yes | Pass | Aug 21 | feat: open-source VPS install (./install.sh, single seat) |
| [13](https://github.com/ivanillka/f-motion/pull/13) | Yes | Pass | Aug 20 | feat: one-click FAL voice-over from scene captions |
| [12](https://github.com/ivanillka/f-motion/pull/12) | Yes | Pass | Aug 20 | fix: keep partner providers private to the allowlisted account |
| [10](https://github.com/ivanillka/f-motion/pull/10) | Yes | **Fail** | Aug 7 | fix: influencer Create/Open uses exact media parameters |
| [7](https://github.com/ivanillka/f-motion/pull/7) | **No** | No checks | Aug 6 | Docs: partner import recipes + Fotium face UX contract |

**Merged this week:** #23 (reopen hosted studio), #22 (ephemeral bulk renders).

### CI health

| Workflow | Default branch | Open PRs |
|----------|----------------|----------|
| `ci` / verify | Pass (Sep 8) | 4 failing, 7 passing |
| `deploy` | **Fail** Sep 8 — missing Cloudflare/Supabase secrets | N/A |
| `Publish F-Motion skill` | Pass | Pass |

Deploy failure is likely expected if infra is migrating to Hetzner (#20); still blocks automated Pages deploy until secrets are set or workflow is gated/disabled.

### Stale branches (no open PR, last commit >30 days)

| Branch | Last commit |
|--------|-------------|
| `advisor/017-integrate-gate2-export` | Jul 28 |
| `advisor/018-server-drafts-list` | Jul 27 |
| `advisor/019-scene-audio-level` | Jul 27 |
| `advisor/020-silent-video-audio-pad` | Jul 28 |
| `advisor/021-render-failure-retry` | Jul 28 |
| `advisor/022-conflict-save-as-copy` | Jul 28 |
| `advisor/023-minimal-settings` | Jul 28 |
| `advisor/024-object-storage-cors-docs` | Jul 28 |
| `advisor/025-hosted-api-proxy-docs` | Jul 28 |
| `advisor/026-media-attach-poll` | Jul 28 |
| `advisor/027-fmotion-env-hosted` | Jul 28 |
| `advisor/048-fal-byok-credential-boundary` | Aug 2 |
| `advisor/048-integrate-reliability` | Aug 1 |
| `advisor/140-split-client-no-payments-slice` | Jul 28 |
| `advisor/collapsed-ai-architecture` | Aug 2 |
| `advisor/export-quality-merge` | Jul 27 |
| `advisor/import-existing-media` | Aug 2 |
| `advisor/pexels-byok` | Aug 2 |
| `advisor/provider-feature-locks` | Aug 2 |
| `advisor/provider-onboarding` | Aug 2 |
| `agent/improve-scene-footage-search` | Aug 1 |
| Merged `cursor/*` branches (6) | Aug 6 |

**Stale open drafts** (no update >14 days): #7, #10, #12–#18.

---

## f-engine

**Default branch:** `main`  
**URL:** https://github.com/ivanillka/f-engine  
**Last push:** 2026-07-30 (41 days ago)

| Signal | Status |
|--------|--------|
| Open PRs | 0 |
| Open issues | 0 |
| CI workflows | None configured |
| Branches | `main` only |

Host-neutral vertical-video engine; initial public release committed Jul 30. No activity since.

---

## Fotium / Fotium---candy

| Repo | Result |
|------|--------|
| `ivanillka/Fotium` | 404 — not found |
| `ivanillka/Fotium---candy` | 404 — not found |
| `ivanillka/fotium`, `fotium-candy`, etc. | 404 — not found |

The GitHub App installation for this automation only has access to `ivanillka/ivan-pruss-agentic-ops`. Fotium-related work appears integrated into f-motion (PRs #6, #9, #11, #7 reference Fotium auth/queue/UX). **Cannot verify PR/CI/branch state for standalone Fotium repos.**

---

## Risk matrix

| Risk | Severity | Impact |
|------|----------|--------|
| Default-branch deploy red (missing secrets) | High | No automated deploy on merge; silent drift if manual deploy assumed |
| 4 draft PRs with failing CI | High | Block merge; may mask regressions if ignored |
| 12 open PRs / branch sprawl | Medium | Review fatigue, rebase conflicts, unclear priority |
| Fotium repos invisible | Medium | Partner release discipline unmonitored |
| f-engine dormant | Low–Medium | Engine may be superseded by f-motion; or needs explicit roadmap |

---

## Recommended next actions

### This week (P0)

1. **Resolve deploy workflow** — Either restore Cloudflare/Supabase secrets on `f-motion`, or disable/gate `deploy` until Hetzner migration (#20) lands. Document intended hosting path.
2. **Triage failing drafts** — Fix or close #21, #20, #17, #10. Rebase onto current `advisor/133-design-contract` before re-running CI.
3. **Review #24** — CI green; candidate to mark ready-for-review if demo-browser upload work is complete.

### Soon (P1)

4. **Draft PR hygiene** — Close or consolidate stale drafts (#7 docs-only since Aug 6; #15/#16 OSS launch overlap). Pick one hosting track (Hetzner #20 vs marketing fix #21).
5. **Branch cleanup** — Delete merged `cursor/*` branches and orphan `advisor/*` branches with no PR (list above). Reduces noise for future pulses.
6. **Grant repo access** — Add `Fotium` / `Fotium---candy` to the automation GitHub App (or confirm repos are archived/renamed) so future pulses can cover partner release discipline.

### When capacity allows (P2)

7. **f-engine decision** — Archive, document relationship to f-motion, or schedule a maintenance pass (deps, README status).
8. **CI signal clarity** — Consider required-check rules so deploy failures on default branch surface as branch protection violations.

---

*Next pulse scheduled: 2026-09-16 (Sunday 07:00 UTC).*
