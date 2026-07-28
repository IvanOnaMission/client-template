# raw/ — source layer

Raw, immutable source material. This is the **raw layer** of the Karpathy LLM-Wiki
pattern this repo runs (see `../CLAUDE.md`).

Drop here:
- Sent emails (for voice training)
- Voice notes and transcripts
- Audit / discovery call transcripts
- Screenshots, exports, web clippings

**Agents do NOT read this folder directly.** Material here gets *ingested* —
synthesised into the structured, tier-aware `Brain 2/wiki/` (the wiki layer) — and then
left in place.

Rules:
- **Never delete or edit a source.** Raw files are immutable — they are the
  evidence the `Brain 2/wiki/` cites back to.
- Keep files in their natural format (`2026-05-27-discovery-call.md`,
  `sent-emails-batch-1.md`).
- Don't pre-create subfolders. Add them when there's something to put in them.
