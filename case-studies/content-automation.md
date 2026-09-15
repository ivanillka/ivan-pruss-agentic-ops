# Content automation / auto-linking

Less curation busywork. The system holds the structure.

## Problem

Internal linking and publish busywork were manual. A note could be written and still not be connected to related pages. Publishing meant repeating the same storage, API, and "is it live?" steps.

That work is easy to postpone and expensive when it piles up. Editors spend attention on plumbing instead of the page.

## Fix

Two layers, both boring on purpose:

1. **Publish pipeline.** Notes move through a defined path: note → storage → API → live. Each hop is checkable. A failed hop is a failed publish, not a silent partial update.
2. **Rule-based auto-linking.** Once content items exist, a linker applies rules (title, slug, known entities) and writes internal links instead of waiting for a manual pass.

This sits next to the [Personal Ops OS](personal-ops-os.md) publish path. The OS decides *whether* something ships. The pipeline decides *how* it ships.

I am not linking private vault files or client CMS internals.

## Result

Less manual curation. The system does the repetitive structure work: placing the object, calling the API, and wiring related pages together.

**Portfolio example, not confidential client data:** on a sample content set this style of rule-based linker produced on the order of ~227 internal links across 10+ items. Treat those figures as an illustration of volume, not a production KPI and not a named-customer metric.

Qualitative result, which is the part I would hire for:

- publish is a pipeline with logs, not a checklist in chat
- links are generated from rules, then reviewed, rather than invented one by one
- the same rollback mindset applies: a bad publish is reversed from the report, not guessed

## Why this matters for hiring

This is enablement. Operators should spend time on exceptions and editorial judgment, not on repeating the same linking and upload steps.

Related public pages:

- [Personal Ops OS](personal-ops-os.md)
- [Fotium release discipline](fotium-release-discipline.md)
- [Positioning](../docs/positioning.md)
