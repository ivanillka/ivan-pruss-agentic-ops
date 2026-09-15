# Deploy report (example)

This is a **fixture**, not a log from a real production host. SHA, branch, and timestamps are illustrative.

- **When:** 2026-09-15T08:00:00Z
- **Git SHA:** `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa`
- **Branch:** `main`
- **Tree:** clean
- **Target:** sample (no remote)
- **Operator decision:** GO

## Gates

| Step | Result | Notes |
|---|---|---|
| preflight | PASS | git metadata recorded |
| lint | SKIP | no linter configured in this sample repo |
| tests | SKIP | no test runner configured in this sample repo |
| build | SKIP | no build step in this sample repo |
| smoke | PASS | required sample files exist |
| post-deploy verify | SKIP | no remote target in the sample runner |

SKIP here is explicit and documented. A production Fotium path would require lint, tests, build, and live smoke to PASS.

## Smoke

- Check: required files `README.md`, `report-template.md`, `run.sh` exist in `deploy-assistant/`
- Result: PASS

## Rollback

```sh
echo "rollback candidate: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
echo "sample runner made no remote changes"
```

## Notes

~30s gated path once local checks are warm. Timing is for the operator sequence, not a customer SLA.
