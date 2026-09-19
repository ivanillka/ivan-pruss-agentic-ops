# Fotium production publish and auto-linking

Measured production path: notes to live pages, with rule-based internal links.

## Problem

Internal linking and publish busywork were manual. A note could be written and still not be connected to related pages. Publishing meant repeating the same object-storage, admin API, and "is it live?" steps.

That work is easy to postpone and expensive when it piles up. Attention goes to plumbing instead of the page.

## Fix

Two layers, both boring on purpose:

1. **Publish pipeline.** Notes move through a defined path: notes → object storage → admin API → live. Each hop is checkable. A failed hop is a failed publish, not a silent partial update.
2. **Rule-based auto-linking.** Once content items exist, a linker applies rules (title, slug, known entities) and writes internal links instead of waiting for a manual pass.

CI sits in front of the live hop. Lint, types, tests, Playwright, and build must pass. A red gate is a stop.

This sits next to the [Personal Ops OS](personal-ops-os.md) publish path. The OS decides *whether* something ships. The pipeline decides *how* it ships.

Standalone Fotium application repos are not public. This page reports the operating pattern and the measured counts from a production-lab publish. It does not link private vault files or CMS internals.

## Result

Measured production publish (personal/production lab):

| Metric | Value |
|---|---|
| Internal links generated | **227** |
| Content items | **10+** |
| Publish path | notes → object storage → admin API → live |
| CI gates | lint, types, tests, Playwright, build |

The system does the repetitive structure work: placing the object, calling the admin API, and wiring related pages together.

What changed in practice:

- publish is a pipeline with logs, not a checklist in chat
- links are generated from rules, then reviewed, rather than invented one by one
- a bad publish is reversed from the report, not guessed

## Limits (kept honest)

- The linker is **rule-based**. It is not a trained ranker, and it does not claim semantic search quality.
- This is a **personal/production lab**, not a 50-person engineering organization. The counts are real. The org scale is not enterprise.
- I am not publishing hostnames, IPs, local machine paths, or confidential CMS payloads.

## Why this matters for hiring

This is enablement. Operators should spend time on exceptions and editorial judgment, not on repeating the same linking and upload steps.

Related public pages:

- [Personal Ops OS](personal-ops-os.md)
- [Fotium release discipline](fotium-release-discipline.md)
- [My VPS Guard](my-vps-guard.md)
- [Case study index](README.md)
- [Positioning](../docs/positioning.md)
