# Personal Ops OS

Knowledge to execution, without the side-of-desk ritual.

## Problem

Knowledge and tasks lived in messy daily habits. Notes, inbox, and "I will remember this" sat next to each other with no gate between capture and action.

That created three failures that show up in Product Ops too:

- **No gates.** Anything could become today's work, so the day started already noisy.
- **Noisy signals.** Digests, inboxes, and open loops arrived with the same urgency.
- **Hard to keep a daily system.** The process existed in my head. It did not survive a bad morning.

This case study stays high-level on purpose. It describes the operating design, not a private vault.

## Fix

I designed a personal knowledge OS around an Obsidian-based architecture:

- **Capture is cheap.** Notes and tasks land in known places. They do not have to be perfect on the way in.
- **Daily routines are gated.** A daily note is not a journal dump. It is a theme-gated pipeline: what is in scope today, what is blocked, and what is explicitly deferred.
- **SOPs are written.** Recurring work (inbox, publish, review) has a short procedure, not a remembered sequence.
- **Automation around inbox and digests.** Scripts and AI drafts reduce sorting work. They do not auto-commit irreversible actions.
- **Publish path.** When a note is actually for a production site, it follows a publish pipeline instead of copy-paste from the vault.

The important design choice is the gate. AI can summarize, tag, and draft. A human still decides GO or NO-GO before anything leaves the working set.

## Result

A repeatable second-brain-to-execution loop:

1. Capture
2. Gate (theme, priority, or explicit defer)
3. Execute
4. Log what changed
5. Publish only through the publish path

Signals got quieter because not every note is a task, and not every digest is an interrupt. The reliability habits (locks, logs, rollback mindset) are the transferable part. They are the same habits I use for Product Ops and release work.

I am not publishing private vault files, local paths, or invented throughput numbers. The operating idea is the proof: a daily system that can be described, handed over, and run again tomorrow.

## Why this matters for hiring

This is Product Ops in miniature. The artifact is not "I use Obsidian." The artifact is a workflow with gates, written procedures, and a path from knowledge to a shipped page.

Related public pages:

- [Positioning](../docs/positioning.md)
- [Fotium production publish](content-automation.md)
- [My VPS Guard](my-vps-guard.md)
- [How I work](../README.md#how-i-work)
