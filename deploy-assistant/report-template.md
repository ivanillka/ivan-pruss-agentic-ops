# Deploy report

- **When:** YYYY-MM-DDTHH:MM:SSZ
- **Git SHA:** `<40-char-sha>`
- **Branch:** `<branch>`
- **Tree:** clean | dirty
- **Target:** staging | production | sample (no remote)
- **Operator decision:** GO | NO-GO

## Gates

| Step | Result | Notes |
|---|---|---|
| preflight | PASS / FAIL | |
| lint | PASS / FAIL / SKIP | |
| tests | PASS / FAIL / SKIP | |
| build | PASS / FAIL / SKIP | |
| smoke | PASS / FAIL / SKIP | |
| post-deploy verify | PASS / FAIL / SKIP | |

A `FAIL` anywhere required is a NO-GO. `SKIP` is allowed only with a written reason. Do not encode skips as `|| true`.

## Smoke

- Check: `<command or URL pattern, no private hostnames>`
- Result:

## Rollback

If this SHA must be undone:

```sh
# Replace with the real reverse command for the environment.
# Example shape only:
#   git revert --no-edit <sha>
#   # or promote the previous known-good deployment in the host UI
echo "rollback candidate: <sha>"
```

## Notes

- Do not paste tokens, `.env` contents, emails, or phone numbers into this file.
- Do not write local absolute paths from a home machine.
