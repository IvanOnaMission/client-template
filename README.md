# Client Repo — Template

> **Setting this up on a machine? Go straight to [`SETUP.md`](SETUP.md)** — the numbered,
> copy-paste checklist (macOS + Windows), from install to a verified working system.
> This page is the concepts.

The full folder structure for a Flowstate client's AI Operating System. It's a **GitHub
template repo** — new clients are stamped out with "Use this template" (see `SETUP.md`
step 2). It uses the same **two-brain** model as Flowstate's own setup.

## How to use

1. Create the client's repo from this template — **private**, under `FlowState-clients`, named after the business (e.g. `acme-electrical`). The client is added as collaborator.
2. Follow [`SETUP.md`](SETUP.md) on their machine, end to end.
3. Fill files **just-in-time** — only what the current module needs. Empty files are a to-do list, not a gap.
4. For each team member, the `onboard-person` skill copies `Brain 2/wiki/people/_TEMPLATE/` → `Brain 2/wiki/people/their-name/`.

## The structure

```
[business-name]/
│
├── CLAUDE.md            <- rulebook — explains the two brains, every agent reads first
│
├── Brain 1/             <- COCKPIT — small, ALWAYS loaded, no business facts (links to wiki)
│   ├── README.md         the cockpit explained
│   ├── startup.md        what loads every session, in order
│   ├── context.md        who the owner is + how to work with them + decision rights
│   ├── memory-rules.md   where facts go: boundary test + check-before-you-write
│   ├── structure.md      folder map + filing rules
│   ├── boundaries.md     always-on safety rules (never auto-send, never invent, escalate)
│   └── now.md            current state of play — one screen, links not copies
│
├── Brain 2/             <- KNOWLEDGE wiki — loaded ON DEMAND
│   ├── CLAUDE.md         wiki schema (ingest/query/lint)
│   ├── index.md          catalog — read first to find a page
│   ├── log.md            ingest/query/lint history
│   ├── raw/             immutable sources (emails, transcripts, exports) — agents don't read directly
│   └── wiki/            synthesised pages (one topic per file):
│       ├── business.md · services.md · faq.md · boundaries.md
│       ├── commercials.md · customers.md · customer-journey.md
│       ├── decision-rules.md · operations.md · existing-ai.md
│       ├── stories.md · suppliers-partners.md
│       ├── access-tracker.md · metrics.md
│       └── people/       one folder per team member
│
└── agents/             <- the automations (one folder each)
```

## The two brains
- **Brain 1** = the cockpit: always loaded, small. How sessions start, the rules, who the
  owner is, current state. **Holds NO business facts — it links to the wiki.** (One fact,
  one home: copies drift apart, links don't.)
- **Brain 2** = the knowledge: on demand, can be large. Raw sources → synthesised wiki.
- Don't read Brain 2 unless a task needs it — Brain 1 covers the everyday.

## Fill order (Brain 2/wiki)
- **v0 — before any build:** `business.md`, `services.md`, `faq.md`, `boundaries.md`, `commercials.md`, `access-tracker.md`, each person's voice + triage in `people/`. Plus fill `Brain 1/` (context, boundaries).
- **v1 — within 30 days:** `customers.md`, `customer-journey.md`, `decision-rules.md`, `operations.md`
- **v2 — as agents reveal gaps:** `suppliers-partners.md`, `metrics.md`, `existing-ai.md`, `stories.md`

## Rules
- Plain markdown, one topic per file. Never commit credentials (`access-tracker.md` = status only).
- `Brain 2/raw/` is immutable — never edit a source.
- Edits auto-sync via the Obsidian Git plugin.
