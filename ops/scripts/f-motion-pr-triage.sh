#!/usr/bin/env bash
# Quick triage helpers for f-motion open PRs. Requires gh + git write on f-motion.
set -euo pipefail

REPO="${REPO:-ivanillka/f-motion}"
BASE="${BASE:-advisor/133-design-contract}"

usage() {
  cat <<EOF
Usage: $0 <command>

Commands:
  status          Print open PRs with CI state
  fix-21-20       Show one-line fix for previewRenderLabel CI failure
  rebase <pr>     Checkout PR branch, rebase onto $BASE, push
  ready <pr>      Mark draft PR ready for review

Examples:
  $0 status
  $0 rebase 21
  $0 ready 24
EOF
}

cmd_status() {
  gh pr list --repo "$REPO" --state open \
    --json number,title,isDraft,headRefName,updatedAt,statusCheckRollup \
    --jq '.[] | {
      pr: .number,
      draft: .isDraft,
      branch: .headRefName,
      updated: .updatedAt[0:10],
      ci: (
        [.statusCheckRollup[]? | select(.name=="verify") | .conclusion][0] // "none"
      ),
      title: .title
    }'
}

cmd_fix_21_20() {
  cat <<'EOF'
Add to apps/web/src/main.tsx before renderLabel assignment:

  const previewRenderLabel = import.meta.env.VITE_RENDER_LABEL?.trim() || "720p preview";

Affected PRs: #21 (cursor/fix-marketing-site-ffcc), #20 (cursor/hetzner-hosted-ffcc)
Then: git rebase origin/advisor/133-design-contract && git push --force-with-lease
EOF
}

cmd_rebase() {
  local pr="$1"
  local branch
  branch=$(gh pr view "$pr" --repo "$REPO" --json headRefName -q .headRefName)
  local dir
  dir=$(mktemp -d)
  trap 'rm -rf "$dir"' EXIT
  git clone --branch "$branch" "https://github.com/${REPO}.git" "$dir"
  cd "$dir"
  git fetch origin "$BASE"
  git rebase "origin/$BASE"
  git push --force-with-lease origin "$branch"
  gh pr checks "$pr" --repo "$REPO" --watch
}

cmd_ready() {
  gh pr ready "$1" --repo "$REPO"
  echo "PR #$1 marked ready for review"
}

case "${1:-}" in
  status) cmd_status ;;
  fix-21-20) cmd_fix_21_20 ;;
  rebase) cmd_rebase "${2:?PR number required}" ;;
  ready) cmd_ready "${2:?PR number required}" ;;
  *) usage; exit 1 ;;
esac
