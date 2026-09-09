# Access blocker — cannot execute f-motion remediations

**Status:** blocked (2026-09-09)

## What failed

User asked the agent to execute remaining pulse actions (“you do” / “doesn’t work”).

| Check | Result |
|-------|--------|
| GitHub App installation repos | **only** `ivanillka/ivan-pruss-agentic-ops` |
| Cloud Agent environment repos | **only** `github.com/ivanillka/ivan-pruss-agentic-ops` |
| `git push` to f-motion | `Permission denied to cursor[bot]` (403) |
| Close issue / mark PR ready / delete branch | 403 |

Creating issues on public `f-motion` worked earlier; **write** (contents/PR mutation) did not.

## Fix (owner must do once)

1. GitHub → Settings → Applications → **Cursor** → Configure  
   https://github.com/settings/installations
2. Add repository **`ivanillka/f-motion`** (and Fotium/f-engine if desired).
3. Ensure permissions: Contents R/W, Pull requests R/W, Issues R/W.
4. Optionally add the repo to the Cloud Agent environment:  
   https://cursor.com/dashboard/cloud-agents/environments/e/55127976-ac9a-11f1-ba66-0e7d0216e441
5. Reply **go** — agent runs `./ops/scripts/execute-f-motion-pulse-actions.sh`.

## Ready when unblocked

- Issues filed: #26, #27, #28 (+ accidental #25 to close)
- Executor: `ops/scripts/execute-f-motion-pulse-actions.sh`
- Patch: `ops/patches/f-motion-previewRenderLabel.patch`
