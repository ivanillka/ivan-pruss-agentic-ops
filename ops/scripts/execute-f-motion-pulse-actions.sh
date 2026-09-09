#!/usr/bin/env bash
# Execute all remaining 2026-09-09 weekly-pulse actions on ivanillka/f-motion.
# Requires: gh authenticated as a user/app with write access to f-motion.
#
# What this does:
#   1. Close accidental issue #25
#   2. Fix previewRenderLabel on PRs #21 and #20, rebase, push
#   3. Mark PR #24 ready for review
#   4. Delete merged/orphan branches (DRY_RUN=0)
#   5. Comment status on tracking issues #26–#28
#
# Usage:
#   ./ops/scripts/execute-f-motion-pulse-actions.sh
set -euo pipefail

REPO="${REPO:-ivanillka/f-motion}"
BASE="${BASE:-advisor/133-design-contract}"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
WORKDIR="${WORKDIR:-$(mktemp -d)}"
trap 'rm -rf "$WORKDIR"' EXIT

need_write() {
  echo "ERROR: cursor[bot] cannot write to ${REPO}." >&2
  echo "Grant the Cursor GitHub App 'Contents: Write' + 'Pull requests: Write' + 'Issues: Write' on ${REPO}, then re-run." >&2
  echo "Settings: https://github.com/apps/cursor → Configure → Repository access → include ${REPO}" >&2
  exit 1
}

# Probe write access
if ! gh api -X POST "repos/${REPO}/git/refs" \
  -f ref="refs/heads/ops-write-probe-$$" \
  -f sha="$(gh api "repos/${REPO}/git/ref/heads/${BASE}" -q .object.sha)" >/dev/null 2>&1; then
  need_write
fi
# cleanup probe ref
gh api -X DELETE "repos/${REPO}/git/refs/heads/ops-write-probe-$$" >/dev/null 2>&1 || true

echo "==> Write access OK"

echo "==> Closing accidental issue #25"
gh issue close 25 --repo "$REPO" --comment "Closed by weekly-pulse automation (accidental permission probe)." || true

clone_and_fix_pr() {
  local pr="$1"
  local branch
  branch=$(gh pr view "$pr" --repo "$REPO" --json headRefName -q .headRefName)
  echo "==> Fixing PR #${pr} on ${branch}"
  local dir="${WORKDIR}/pr-${pr}"
  git clone --branch "$branch" "https://github.com/${REPO}.git" "$dir"
  cd "$dir"
  git fetch origin "$BASE"

  # Idempotent one-line fix
  python3 - <<'PY'
from pathlib import Path
path = Path("apps/web/src/main.tsx")
text = path.read_text()
needle = 'const renderLabel = renderKind === "final" ? "final export" : previewRenderLabel;'
fix = 'const previewRenderLabel = import.meta.env.VITE_RENDER_LABEL?.trim() || "720p preview";\n  const renderLabel = renderKind === "final" ? "final export" : previewRenderLabel;'
if "const previewRenderLabel =" in text:
    print("already fixed")
elif needle in text:
    path.write_text(text.replace(needle, fix, 1))
    print("patched")
else:
    raise SystemExit("could not find insertion point in main.tsx")
PY

  git add apps/web/src/main.tsx
  if ! git diff --cached --quiet; then
    git -c user.email="automation@cursor.com" -c user.name="Cursor Automation" \
      commit -m "fix: define previewRenderLabel for render UI label"
  fi

  git rebase "origin/${BASE}"
  git push --force-with-lease origin "HEAD:refs/heads/${branch}"
  echo "    pushed; CI will re-run on #${pr}"
}

clone_and_fix_pr 21
clone_and_fix_pr 20

echo "==> Marking PR #24 ready for review"
gh pr ready 24 --repo "$REPO" || true

echo "==> Branch cleanup"
DRY_RUN=0 REPO="$REPO" bash "${ROOT}/ops/scripts/f-motion-branch-cleanup.sh"

echo "==> Commenting on tracking issues"
for n in 26 27 28; do
  gh issue comment "$n" --repo "$REPO" --body "Weekly-pulse follow-up executed by automation. See ops/scripts/execute-f-motion-pulse-actions.sh in ivan-pruss-agentic-ops." 2>/dev/null || true
done

echo "==> Done. Check:"
echo "  https://github.com/${REPO}/pull/21"
echo "  https://github.com/${REPO}/pull/20"
echo "  https://github.com/${REPO}/pull/24"
echo "  https://github.com/${REPO}/issues/28  (deploy secrets still need manual choice)"
