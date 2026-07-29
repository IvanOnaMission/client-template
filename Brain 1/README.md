# Brain 1 — the cockpit ([Business Name])

**Brain 1 = everything the AI needs at startup. Brain 2 = everything the business knows.**
That's the whole split. If it's a business fact (a price, a process, a customer, a person)
→ it lives in `../Brain 2/wiki/`. If it's "how sessions start, where files go, what the AI
may do, what's happening right now" → it lives here.

**Hard rule: no business facts in Brain 1.** These files may LINK to a wiki page, never
copy from it. Why: a copy and its original always drift apart, and then the AI works from
stale information. One fact, one home.

## The files

| File | What it is |
|---|---|
| [startup](startup.md) | **What loads every session**, in order, and why. |
| [context](context.md) | **Who the owner is** — how they communicate, and what the AI may do without asking (decision rights). Always loaded. |
| [memory-rules](memory-rules.md) | **Where facts go** — the stores, the boundary test, and the check-before-you-write protocol. Always loaded. |
| [structure](structure.md) | **The folder map** — what lives where, what never lives where. |
| [boundaries](boundaries.md) | **Hard safety rules** the AI must always respect. Always loaded. |
| [now](now.md) | **Current state of play** — one screen, links not copies. Always loaded. |

## Rules for this folder
- Keep every file SMALL. Most of this loads every single session — it costs tokens every time.
- No business knowledge in here. Facts live in `../Brain 2/wiki/`; link, never copy.
- The actual `CLAUDE.md` sits at the repo root (that's where Claude Code looks) — it is
  deliberately thin and points into this folder. Edit meaning here, not there.
