# Agentic Ops brand kit

Visual language for the Ivan Pruss public portfolio. Hiring-facing, not a product brand.

**Voice:** gates, logs, rollback. Security work is defense only.

**Contact in any public surface:** GitHub + EU/remote only. No email, phone, LinkedIn, hostnames, private IPs, or credentials.

## Mark

| Asset | Use |
|---|---|
| [logo-mark.svg](logo-mark.svg) | Avatar, favicon-scale, diagram corner |
| [wordmark.svg](wordmark.svg) | Text-only lockup when the mark is already nearby |
| [logo-lockup.svg](logo-lockup.svg) | README hero, case-study headers |

The mark is a geometric **AO monogram** on a slate badge, latched by a teal gate bar. The letters are the name; the bar is the human decision. It is not a startup lightning bolt.

## Color tokens

Use these hex values in SVG `fill` / `stroke`. Do not introduce neon greens, electric purples, or gradient-mesh backgrounds.

| Token | Hex | Role |
|---|---|---|
| `ao-bg` | `#0F172A` | Diagram canvas (slate-900) |
| `ao-panel` | `#1E293B` | Node / card fill |
| `ao-panel-2` | `#334155` | Secondary panel, divider |
| `ao-border` | `#475569` | Default stroke |
| `ao-text` | `#E2E8F0` | Primary label |
| `ao-muted` | `#94A3B8` | Caption, eyebrow, arrows |
| `ao-teal` | `#0F766E` | Deep teal accent (professional ops) |
| `ao-teal-soft` | `#134E4A` | Gate / decision node fill |
| `ao-gate` | `#2DD4BF` | Gate stroke and latch (use sparingly) |
| `ao-ok` | `#0D9488` | Pass / synced state |
| `ao-warn` | `#D97706` | Rollback, fail-closed, do-not-auto-ban |
| `ao-paper` | `#F1F5F9` | Optional light inset (metric chips) |
| `ao-ink` | `#0F172A` | Text on paper chips |

On GitHub light *and* dark themes, diagrams carry their own `ao-bg` canvas so contrast does not depend on the page background.

## Type

- UI / diagram labels: `ui-sans-serif, system-ui, Segoe UI, Helvetica, Arial, sans-serif`
- Titles: 15–18px, weight 650, `ao-text`
- Node labels: 12–13px, weight 600
- Captions: 11px, `ao-muted`
- All-caps eyebrows only for section chips (`AGENTIC OPS`, `DEFENSE ONLY`). Do not shout body copy.

## Usage notes

1. **One accent.** Teal means a gate or an explicit decision. Everything else stays slate.
2. **Rollback is amber outline, never red explosion.** Calm, reversible, written next to the forward path.
3. **Metrics must already exist in the repo.** Today that is **227** internal links across **10+** items, plus operator-path timings already written in the case studies (~30s gated deploy once warm; ~1 min VPS Guard sync loop). Qualitative chips (live alpha, host boundary, sample / secret-free, human gate) are labels, not KPIs. Do not invent revenue, traffic, waitlists, SLAs, or partner-ops volumes.
4. **No screenshots of real hosts.** If a dashboard is needed, use a diagrammatic panel with placeholder rows (`visitor-01`, `attempt`).
5. **Markdown first.** Prefer committed SVG over PNG. Keep relative links from README and case studies stable.
6. **Do not put PII in SVG `<text>` or `<title>`.** No emails, phone numbers, LinkedIn, hostnames, or private IPs.

## Adjacent pages

- [Visual system](../visual-system.md) — how diagrams are used on this site
- [Positioning](../positioning.md) — hiring one-pager
