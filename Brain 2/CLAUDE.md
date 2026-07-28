# Brain 2 — Knowledge Wiki ([Business Name])

The client's **knowledge layer**, loaded **on demand** (Karpathy LLM-wiki pattern).
Everything the business knows. Two sub-layers + this schema:

- `raw/` — immutable source material (emails, transcripts, exports). Dropped in by
  the client or Flowstate. Agents do **not** read this directly.
- `wiki/` — synthesised pages, **access-tier split** (`public/`, `shared/`, `admin/`,
  `owner/`, `people/`). Maintained by Claude. This is what agents read.
- This file — the schema (how Claude operates the wiki + the tier rules).

`index.md` = catalog of every wiki page (read first to find things).
`log.md` = chronological ingest/query/lint record.

Brain 1 (the always-loaded daily layer) lives one level up in `../Brain 1/`. Don't read
this wiki unless a task needs it — Brain 1 covers the everyday stuff.

---

## Access tiers (read before writing into `wiki/`)
| Tier | Who reads | Examples |
|---|---|---|
| `public/` | Anyone — customers, website | Services, hours, public FAQ, booking |
| `shared/` | DEFAULT — any internal user | How the business runs, ops, AI boundaries |
| `admin/` | Admin + owner | Invoicing rules, customer financials, comms templates |
| `owner/` | Owner only | Margins, financials, HR, strategy |
| `people/{name}/` | Admin-tier | A person's voice + inbox rules |

Full model in `wiki/ACCESS-MODEL.md`. **Customer-facing agents read ONLY `wiki/public/`.**
Enforcement is at the agent level — each agent is scoped to the tiers its role can see.

## The three operations

### INGEST — when new source material arrives
1. Read the source completely.
2. Discuss 2–4 takeaways with the human; **wait for steer** before writing.
3. State which `wiki/` pages (and their tier) you'll touch, then update them — add
   claims with `(source: [[raw/...]])`; never silently overwrite a contradiction (mark
   `⚠️`); pick the tier by sensitivity, ask if unsure.
4. Create new pages for entities/topics that came up (stub is fine).
5. Update `index.md`; append to `log.md` (`## [date] ingest | {title}`).

### QUERY — when the human asks
Read `index.md` first (within the asker's tier) → read the pages → answer with
citations → offer to file genuinely new synthesis back as a page → log it.

### LINT — periodic health check (advisory)
Contradictions, stale claims, orphan pages, missing pages, **tier leaks** (sensitive
content sitting in `shared/`/`public/` — flag first), missing cross-references.

## Rules
- Plain markdown, `kebab-case.md`, one topic per file. `[[backlinks]]` between pages.
- **Never edit `raw/` sources** — immutable. **Never commit credentials** (status only,
  `wiki/admin/access-tracker.md`).
- Fill **just-in-time** — only what the current module needs. Empty files are a to-do list.
- When in doubt — especially about tier — ask before writing.
