# Brain 2 — Knowledge Wiki ([Business Name])

The client's **knowledge layer**, loaded **on demand** (Karpathy LLM-wiki pattern).
Everything the business knows. Two sub-layers + this schema:

- `raw/` — immutable source material (emails, transcripts, exports). Dropped in by
  the client or Flowstate. Agents do **not** read this directly.
- `wiki/` — synthesised pages (one topic per file, plus `people/` for per-person folders).
  Maintained by Claude. This is what agents read.
- This file — the schema (how Claude operates the wiki).

`index.md` = catalog of every wiki page (read first to find things).
`log.md` = chronological ingest/query/lint record.

Brain 1 (the always-loaded daily layer) lives one level up in `../Brain 1/`. Don't read
this wiki unless a task needs it — Brain 1 covers the everyday stuff.

---

## The three operations

### INGEST — when new source material arrives
1. Read the source completely.
2. Discuss 2–4 takeaways with the human; **wait for steer** before writing.
3. State which `wiki/` pages you'll touch, then update them — add
   claims with `(source: [[raw/...]])`; never silently overwrite a contradiction (mark
   `⚠️`).
4. Create new pages for entities/topics that came up (stub is fine).
5. Update `index.md`; append to `log.md` (`## [date] ingest | {title}`).

### QUERY — when the human asks
Read `index.md` first → read the pages → answer with
citations → offer to file genuinely new synthesis back as a page → log it.

### LINT — periodic health check (advisory)
Contradictions, stale claims, orphan pages, missing pages, missing cross-references.

## Rules
- Plain markdown, `kebab-case.md`, one topic per file. `[[backlinks]]` between pages.
- **Never edit `raw/` sources** — immutable. **Never commit credentials** (status only,
  `wiki/access-tracker.md`).
- Fill **just-in-time** — only what the current module needs. Empty files are a to-do list.
- When in doubt, ask before writing.
