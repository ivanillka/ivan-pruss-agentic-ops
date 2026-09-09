#!/usr/bin/env bash
# Delete merged and orphan branches on ivanillka/f-motion.
# Requires: gh CLI authenticated with admin/maintain on the repo.
set -euo pipefail

REPO="${REPO:-ivanillka/f-motion}"
DEFAULT_BRANCH="${DEFAULT_BRANCH:-advisor/133-design-contract}"
DRY_RUN="${DRY_RUN:-1}"

# Merged cursor/* branches (PRs already merged)
MERGED_BRANCHES=(
  cursor/agent-api-cli-190c
  cursor/revert-agent-api-190c
  cursor/restore-agent-email-login-190c
  cursor/fix-import-open-video-190c
  cursor/fix-fotium-auth-code-190c
  cursor/marketing-stitch-190c
  cursor/reopen-hosted-studio-6fb1
  cursor/ephemeral-bulk-renders-ccd2
  cursor/agent-compose-flow-316e
  advisor/056-fotium-queue-edit
)

# Orphan advisor/* branches with no open PR (Jul–Aug 2026)
ORPHAN_ADVISOR_BRANCHES=(
  advisor/017-integrate-gate2-export
  advisor/018-server-drafts-list
  advisor/019-scene-audio-level
  advisor/020-silent-video-audio-pad
  advisor/021-render-failure-retry
  advisor/022-conflict-save-as-copy
  advisor/023-minimal-settings
  advisor/024-object-storage-cors-docs
  advisor/025-hosted-api-proxy-docs
  advisor/026-media-attach-poll
  advisor/027-fmotion-env-hosted
  advisor/048-fal-byok-credential-boundary
  advisor/048-integrate-reliability
  advisor/140-split-client-no-payments-slice
  advisor/collapsed-ai-architecture
  advisor/export-quality-merge
  advisor/import-existing-media
  advisor/pexels-byok
  advisor/provider-feature-locks
  advisor/provider-onboarding
  agent/improve-scene-footage-search
)

delete_branch() {
  local branch="$1"
  if [[ "$branch" == "$DEFAULT_BRANCH" || "$branch" == "main" ]]; then
    echo "SKIP (protected): $branch"
    return
  fi
  if [[ "$DRY_RUN" == "1" ]]; then
    echo "DRY-RUN delete: $branch"
  else
    echo "Deleting: $branch"
    gh api -X DELETE "repos/${REPO}/git/refs/heads/${branch}" || echo "  failed: $branch"
  fi
}

echo "=== Merged branches ==="
for b in "${MERGED_BRANCHES[@]}"; do delete_branch "$b"; done

echo ""
echo "=== Orphan advisor branches (review before --execute) ==="
for b in "${ORPHAN_ADVISOR_BRANCHES[@]}"; do delete_branch "$b"; done

echo ""
if [[ "$DRY_RUN" == "1" ]]; then
  echo "Dry run complete. Re-run with DRY_RUN=0 to delete."
fi
