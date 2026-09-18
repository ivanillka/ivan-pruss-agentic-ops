# Deploy Assistant (sample)

Safe, secret-free demo of the gated deploy path described in [Fotium release discipline](../case-studies/fotium-release-discipline.md).

This is not a production deployer. It does not talk to a VPS, cloud account, or CI secret store. It shows the operator contract:

pre-flight → lint / types / tests / Playwright / build gates → smoke → GO / NO-GO → post-deploy verify → markdown audit report (SHA + rollback command)

Failures are loud. The sample runner uses `set -euo pipefail` and does not swallow a red gate with `|| true`.

## What you get

| File | Role |
|---|---|
| [report-template.md](report-template.md) | Empty report an operator fills or a script writes |
| [example-report.md](example-report.md) | Filled example. SHA and hostnames are placeholders |
| [run.sh](run.sh) | Local demo runner. Inspects this git repo, records gates, writes `reports/` |

## Operator contract

1. **Pre-flight** records git SHA, branch, and whether the tree is clean. Missing git is a NO-GO.
2. **Gates** run only if the corresponding tool exists in PATH. A missing tool is recorded as `SKIP` with a reason, not as a silent pass. A non-zero exit is `FAIL` and the overall decision becomes NO-GO. Production Fotium requires lint, types, tests, Playwright, and build. This sample repo has no app toolchain, so those rows are documented skips.
3. **Smoke** is a local stand-in: required files in this sample must exist. In a real path this is an HTTP health check against a staging URL. This sample never calls a private host.
4. **Decision** is GO only when every required gate is `PASS` or an explicit, documented `SKIP`.
5. **Report** is written under `reports/` with timestamp, SHA, table of gates, decision, and rollback text.

Rollback in this sample is "do not promote the candidate SHA." There is no remote mutation to undo.

## Run the sample

From the repository root:

```sh
./deploy-assistant/run.sh
```

Then open the new file under `deploy-assistant/reports/`. Generated reports are gitignored so a local run does not leak machine paths into a commit.

## What this sample will not do

- read `.env` files or print secret values
- SSH to a server
- call cloud APIs
- record home-directory paths
- invent production metrics
