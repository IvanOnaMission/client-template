# Structure — where everything lives (the filing rules)

The one-page map of this repo. If every agent follows this, the brain never rots.
**When filing anything, find its row here. No row fits → ask, don't guess.**

## The map

| Folder | What lives there | What NEVER lives there |
|---|---|---|
| `Brain 1/` | Startup docs: context, memory rules, boundaries, this map, `now.md` | Business facts (→ wiki), logs, drafts |
| `Brain 2/raw/` | Immutable sources: emails, transcripts, exports, dropped docs | Anything edited after landing — raws are never modified |
| `Brain 2/wiki/` | THE knowledge base — synthesised pages, one topic per file, plus `people/` | Credentials (never, anywhere), current-state notes (→ `now.md`), raw material (→ `raw/`) |
| `Brain 2/wiki/people/` | One folder per team member: voice, triage rules, running memory | Other people's info mixed into one folder |
| `agents/` | The automations, one folder each — code + that agent's own notes | Business knowledge (→ wiki), other agents' files |
| `sync/` | The auto-save and pull scripts — set up once, then leave alone | Anything else |
| `_review-YYYY-MM-DD/` | Quarantine: things that look wrong/stale, parked for the owner to judge | — created as needed; the owner empties it |

## Standing rules (every agent, every session)

- **Capture knowledge as it surfaces.** When a durable fact comes up, file it in the wiki
  (per `Brain 2/CLAUDE.md`) — unprompted. If it isn't captured, it's lost.
- **Check before you write** — the protocol in [memory-rules](memory-rules.md): search
  first, never duplicate, never silently overwrite a contradiction.
- **Never edit `Brain 2/raw/`** — sources are immutable.
- **Never delete the owner's information** — quarantine to a dated `_review-*/` folder;
  the owner decides deletions.
- **Never commit credentials** — status only, in `Brain 2/wiki/access-tracker.md`.
