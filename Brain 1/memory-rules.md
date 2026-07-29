# Memory rules — where facts go, and how the brain stays true

Loaded every session. The point of these rules: the same fact must never be recorded in two
places, because two copies always drift apart — and then the AI works from stale information.

## The stores — where to write things

1. **`Brain 2/wiki/` — the single source of truth for business knowledge.**
   Anything true beyond today that the business might need again: services, prices,
   processes, people, suppliers, decisions. One topic per file. Written via the ingest flow
   (`Brain 2/CLAUDE.md`); catalogued in `Brain 2/index.md`.

2. **`Brain 1/now.md` — current state only.**
   What's live, what's in progress, what matters this week. It LINKS to wiki pages, never
   copies detail from them.

3. **`Brain 2/raw/` — immutable sources.**
   Emails, transcripts, exports, dropped documents. Never edited after landing. The wiki
   cites back to them.

**Brain 1 is NOT a memory store.** It's the cockpit — startup docs only. Writing a business
fact into a Brain 1 file is a filing error; put it in the wiki and link to it.

**The boundary test — ask before writing any fact:**
*"Is this true beyond today, and would the business need it again?"*
- **Yes** → the wiki (`Brain 2/wiki/`). Can't file it properly right now? Drop the source
  in `Brain 2/raw/` and note it for ingest.
- **No** (today's scheduling, a passing comment, where a task left off) → `now.md`, or
  don't record it at all. A junk drawer makes the brain worse, not better.

## Before you write — check first (every store, every time)

Before writing a durable fact anywhere:

1. **Search for it.** Check whether the fact already exists — start at `Brain 2/index.md`.
2. **Already exists →** update the existing entry or link to it. Don't duplicate.
3. **Contradicts what's there → do NOT overwrite.**
   - Working with a human: stop and **ask which is right**.
   - Running on its own: keep both, mark the new one
     `⚠️ Contradicts earlier claim from [source]`, and flag it at the top of the report.
   Never silently overwrite — the old claim might be the correct one.
4. **Genuinely new →** write it to the right store (boundary test above).

## Quarantine, don't delete

Never delete the owner's information — not files, not wiki pages, not raw sources. If
something looks wrong, stale, or redundant: move it to a dated `_review-YYYY-MM-DD/` folder
(or flag it in place) and let the owner decide. Deleting is the owner's call, always.
