# Startup — what loads every session

When anyone opens this repo in Claude Code, this loads, in this order. Everything else in
the repo is read ON DEMAND — that's deliberate (always-loaded files cost tokens every run).

## The load chain

1. **`CLAUDE.md` (repo root)** — the entry point. Claude Code auto-reads it; it @-includes
   everything below. Thin by design: don't add content there, add it to the right file below.
2. **`Brain 1/context.md`** — who the owner is, how to work with them, and what the AI may
   do without asking.
3. **`Brain 1/memory-rules.md`** — where facts go, and the check-before-you-write protocol.
4. **`Brain 1/boundaries.md`** — the hard safety rules (never auto-send, never invent, escalate).
5. **`Brain 1/now.md`** — current state of play (one screen).

## What does NOT load at startup (by design)
- `Brain 2/wiki/` pages — read via `Brain 2/index.md` when a task needs them.
- `Brain 2/raw/` — immutable sources; agents don't read these directly at all.
- Agent definitions in `agents/` — they load when that agent is used.
- Skills — they load when invoked.

## Changing the loadout
Add or remove an @-include in the root `CLAUDE.md`. Ask first: *"does the AI really need
this EVERY session?"* If it's only needed sometimes, it belongs in the wiki (catalogued in
`Brain 2/index.md`) instead.
