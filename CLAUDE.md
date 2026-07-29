# [Business Name] — AI Operating System

This repo is the AI brain and agents for [Business Name]. Owned by the client,
built and maintained by Flowstate.

**Two brains, one rule: `Brain 1/` = the cockpit (how sessions start, the rules, current
state). `Brain 2/` = the knowledge (everything the business knows).** Brain 1 holds no
business facts — its files link to the wiki. One fact, one home; that's what stops the
brain drifting out of date.

## Brain 1 — the cockpit (always loaded)

Small — it costs tokens every run. The load manifest is `Brain 1/startup.md`; the folder
map and filing rules are `Brain 1/structure.md`.

@Brain 1/context.md

@Brain 1/memory-rules.md

@Brain 1/boundaries.md

@Brain 1/now.md

## Brain 2 — the knowledge wiki (on demand)

Everything else, retrieved only when a task needs it. Raw sources in `Brain 2/raw/`
(immutable), synthesised pages in `Brain 2/wiki/`. **Read `Brain 2/index.md` to look
something up.** Full schema: `Brain 2/CLAUDE.md`.

## Rules for any agent

1. Obey `Brain 1/boundaries.md` and the decision rights in `Brain 1/context.md` before
   drafting, sending, quoting, or invoicing.
2. **Check before you write** — follow the protocol in `Brain 1/memory-rules.md`: search
   the store first; never duplicate; never silently overwrite a contradiction.
3. **Capture knowledge unprompted** — when a durable fact surfaces, file it in the wiki
   per `Brain 2/CLAUDE.md` (the `brain-capture` skill). If it isn't captured, it's lost.
4. For a person-specific task, read `Brain 2/wiki/people/{name}/`.
5. One topic per file. No giant docs. Never commit credentials (status only,
   `Brain 2/wiki/access-tracker.md`).
6. Fill **just-in-time** — only what the current module needs. If the brain is wrong or
   missing something, tell the human — don't guess.
7. `Brain 2/raw/` sources are **immutable** — never edit them. Never delete the owner's
   information — quarantine (`_review-YYYY-MM-DD/`) and ask.
8. **Onboard new people automatically.** At the start of a session with someone whose
   `Brain 2/wiki/people/{name}/` folder is missing or still has `[Person Name]`/placeholder
   content, run the **`onboard-person`** skill before doing anything else — interview them
   and fill their files. Don't make a new person work with a blank brain.

## `agents/`

The automations, one folder each. Each agent reads Brain 1 always + Brain 2 on demand.
