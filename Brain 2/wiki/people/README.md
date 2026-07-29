# people/ — per-person memory

Every team member who uses the AI gets their own folder here: `people/{firstname}/`.
**To add a person:** copy `_TEMPLATE/`, rename it, fill the placeholders.

## What's in each person's folder

| File | What it is | Who maintains it | Append or edit? |
|---|---|---|---|
| `memory.md` | **Current state** — who they are, what they're doing now, preferences, recurring tasks | The AI (writes back as it learns) | **EDIT** — rewrite, replace stale facts |
| `log.md` | **History** — timestamped record of what happened / changed | The AI | **APPEND** — never edited |
| `voice.md` | How they write/talk (the AI mimics it) | Set up at onboarding | Edit when their voice drifts |
| `triage.md` | How the AI sorts their inbox (🔴🟠🟢 + VIPs) | Set up at onboarding | Edit as rules change |

## The memory process — how it stays current, not stale

1. The person talks to the AI (via Teams / web — **they never touch GitHub**).
2. The AI loads **this folder** + the wiki pages the task needs.
3. As things change, the AI **edits `memory.md`** — rewrites the line, never stacks a contradiction. Outdated stuff gets replaced.
4. The AI appends a one-line note to `log.md` so there's a history.
5. Git commits every change → nothing is ever lost; any old version is recoverable.

**The whole trick to memory not going stale: the AI keeps ONE clean "here's where they're at" file and edits it — it does not endlessly append.** Editing over appending.

## Privacy

One person's folder is **never loaded into another person's session.** The AI writes ONLY to the folder of whoever is currently talking. This is enforced in the agent's code, not in GitHub (GitHub can't do folder-level access — see [[Brain 2/wiki/concepts/aios-architecture]]).

## ✅ Pre-send checklist — before a person's folder goes live to a client

- [ ] Folder named `people/{firstname}/`, copied from `_TEMPLATE/`
- [ ] All `[Person Name]` placeholders replaced throughout
- [ ] `voice.md` filled — 15–20 of their **real sent messages** pasted (the voice fingerprint)
- [ ] `triage.md` filled — 🔴/🟠/🟢 rules + VIP bypass list + SMS recipient
- [ ] `memory.md` seeded — role, current focus, preferences, the **Do NOT** list
- [ ] `log.md` started with a dated "folder created" line
- [ ] Confirmed the agent writes **only** to this folder for this person's session
- [ ] **No credentials anywhere** in the folder
