# Client Repo — Template

The full folder structure for a Flowstate client's AI Operating System. Copy this
whole folder when onboarding a new client. It uses the same **two-brain** model as
Flowstate's own setup.

## How to use

1. Copy this folder → rename it after the client's business (e.g. `acme-electrical`).
2. That folder becomes the client's private GitHub repo on Ivan's GitHub; the client is added as collaborator.
3. Fill files **just-in-time** — only what the current module needs. Empty files are a to-do list, not a gap.
4. For each team member, copy `Brain 2/wiki/people/_TEMPLATE/` → `Brain 2/wiki/people/their-name/`.

## The structure

```
[business-name]/
│
├── CLAUDE.md            <- rulebook — explains the two brains, every agent reads first
│
├── Brain 1/             <- DAILY layer — small, ALWAYS loaded
│   ├── business.md       business at a glance
│   ├── active-now.md     current state: live + in-progress automations, priorities
│   ├── boundaries.md     always-on safety rules (never auto-send, never invent, escalate)
│   └── MEMORY.md         index
│
├── Brain 2/             <- KNOWLEDGE wiki — loaded ON DEMAND
│   ├── CLAUDE.md         wiki schema (ingest/query/lint + tier rules)
│   ├── index.md          catalog — read first to find a page
│   ├── log.md            ingest/query/lint history
│   ├── raw/             immutable sources (emails, transcripts, exports) — agents don't read directly
│   └── wiki/            synthesised pages, ACCESS-TIER split:
│       ├── ACCESS-MODEL.md
│       ├── public/       customer-safe
│       ├── shared/       default internal
│       ├── admin/        admin + owner
│       ├── owner/        owner only
│       └── people/       one folder per team member
│
└── agents/             <- the automations (one folder each)
```

## The two brains
- **Brain 1** = daily, always loaded, small. Who they are + current state + safety rules.
- **Brain 2** = knowledge, on demand, can be large. Raw sources → tier-split wiki.
- Don't read Brain 2 unless a task needs it — Brain 1 covers the everyday.

## Access tiers (Brain 2) — read `Brain 2/wiki/ACCESS-MODEL.md` before filling
| Tier | Who sees it | Examples |
|---|---|---|
| `public/` | Anyone — customers, website | Services, hours, booking, public FAQ |
| `shared/` | Any internal user (default) | How the business runs, customer journey, ops |
| `admin/` | Admin + owner | Invoicing rules, customer financials, access tracker |
| `owner/` | Owner only | Margins, financials, HR, strategy |

Default new content to `shared/`. Promote up a tier as sensitivity demands.
**Customer-facing agents read ONLY `public/`.**

## Fill order (Brain 2/wiki)
- **v0 — before any build:** `shared/business.md`, `services.md`, `faq.md`, `boundaries.md`, `commercials.md`, `admin/access-tracker.md`, each person's voice + triage in `people/`. Plus fill `Brain 1/` (business, boundaries).
- **v1 — within 30 days:** `shared/customers.md`, `customer-journey.md`, `decision-rules.md`, `operations.md`
- **v2 — as agents reveal gaps:** `shared/suppliers-partners.md`, `owner/metrics.md`, `shared/existing-ai.md`, `stories.md`
- **Customer-facing module built:** populate `public/`

## Rules
- Plain markdown, one topic per file. Never commit credentials (`access-tracker.md` = status only).
- `Brain 2/raw/` is immutable — never edit a source.
- Edits auto-sync via the Obsidian Git plugin.
