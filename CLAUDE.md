# [Business Name] — AI Operating System

This repo is the AI brain and agents for [Business Name]. Owned by the client,
built and maintained by Flowstate.

Knowledge is split into **two brains** (same model as Flowstate's own setup):

## `Brain 1/` — daily layer (always loaded)
Small. Read it **every run**. Who the business is, current state, and the hard safety
rules. Keep it short — it costs tokens every time.
- `Brain 1/business.md` — the business at a glance
- `Brain 1/active-now.md` — current state (live + in-progress automations, priorities)
- `Brain 1/boundaries.md` — always-on safety rules (never auto-send, never invent, escalate)
- `Brain 1/MEMORY.md` — the index

@Brain 1/business.md
@Brain 1/active-now.md
@Brain 1/boundaries.md

## `Brain 2/` — knowledge wiki (on demand)
Everything else, retrieved only when a task needs it. Raw sources in `Brain 2/raw/`,
synthesised **access-tier-split** pages in `Brain 2/wiki/`. **Read `Brain 2/wiki/index.md`
to look something up.** Full schema + tier rules: `Brain 2/CLAUDE.md`.

## Rules for any agent
1. **Respect access tiers** — read only the tiers the acting user/role can see
   (`Brain 2/wiki/ACCESS-MODEL.md`). **Customer-facing agents read ONLY `Brain 2/wiki/public/`.**
2. Obey `Brain 1/boundaries.md` before drafting, sending, quoting, or invoicing.
3. For a person-specific task, read `Brain 2/wiki/people/{name}/`.
4. One topic per file. No giant docs. Never commit credentials (status only,
   `Brain 2/wiki/admin/access-tracker.md`).
5. Fill **just-in-time** — only what the current module needs. If the brain is wrong or
   missing something, tell the human — don't guess.
6. `Brain 2/raw/` sources are **immutable** — never edit them.
7. **Onboard new people automatically.** At the start of a session with someone whose `Brain 2/wiki/people/{name}/` folder is missing or still has `[Person Name]`/placeholder content, run the **`onboard-person`** skill before doing anything else — interview them and fill their files. Don't make a new person work with a blank brain.

## `agents/`
The automations, one folder each. Each agent reads Brain 1 always + the Brain 2 tiers its role allows.
