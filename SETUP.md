# Setup — standing up a client's AI Operating System

This repo is the full file structure for a Flowstate client's **AI Operating System (AIOS)** —
the brain and agents that make a business readable and workable by AI. Follow these steps to
stand up a new client from this template.

> New here? Read [`README.md`](README.md) first for the two-brain model.

---

## What you're setting up

- **Brain 1** — the small, always-loaded cockpit (who the owner is, the rules, current state — no business facts, it links to the wiki).
- **Brain 2** — the on-demand knowledge wiki (synthesised pages, one topic per file).
- **agents/** — the automations that read the brain and do the work.
- **sync/** — auto-saves the brain to GitHub and pulls updates back.

---

## Prerequisites (on the client's machine)

- **[Claude Code](https://claude.com/claude-code)** installed — the brain runs here, and the
  auto-save hooks only fire in Claude Code (Desktop alone has no hooks).
- **Git + a GitHub account** — the brain is a private repo that auto-saves and syncs via git.
- **python3** — the auto-save hook uses it to parse file paths.
- *(Optional)* **[Obsidian](https://obsidian.md)** — open the repo as a vault to browse and edit
  the brain like a nice notes app.

---

## 1. Make it the client's repo

1. Copy this whole folder and rename it after the business — e.g. `acme-electrical`.
2. Create a **private** GitHub repo and push it up.
3. Add the client as a collaborator (or use the [Flowstate Client Kit](https://github.com) to
   generate a one-click setup for a non-technical client).

## 2. First open in Claude Code

- Open the folder in Claude Code.
- It reads `CLAUDE.md` first → always loads **Brain 1**, and knows **Brain 2** is read on demand.
- Everything is `[Business Name]` placeholder until you fill it — that's expected.

## 3. Fill the brain — *just in time*

You don't fill everything up front. The empty files are a to-do list, not a gap. Fill only what
the automation you're building needs.

- Run the **`onboard-business`** skill → it ingests their materials and fills `Brain 2/wiki/` + `Brain 1/` (context, boundaries, decision rights).
- For each team member, run **`onboard-person`** → fills `Brain 2/wiki/people/{name}/` (their voice,
  triage rules, and running memory).
- As you learn things day to day, the **`brain-capture`** skill files them in the right place.

## 4. Turn on sync

Follow [`sync/SETUP.md`](sync/SETUP.md):
- **Push** (auto-save) — instant, every write, so memory is never lost to a crash.
- **Pull** — scheduled (every 6h), so the client picks up updates you push.

## 5. Build the agents

Each automation is a folder in `agents/`. Every agent reads **Brain 1 always** + **Brain 2 on
demand** — only the pages the current task needs.

---

## The golden rules (also in `CLAUDE.md`)

1. **Obey `Brain 1/boundaries.md`** before drafting, sending, quoting, or invoicing.
2. **Check before you write** — the protocol in `Brain 1/memory-rules.md`: search first,
   never duplicate, never silently overwrite a contradiction.
3. **Fill just-in-time** — only what the current module needs; if the brain is wrong or missing
   something, say so, don't guess.
4. **Never commit credentials** — status only, in `Brain 2/wiki/access-tracker.md`.
5. **`Brain 2/raw/` is immutable** — never edit a raw source; the wiki cites back to it.
   And never delete the owner's information — quarantine (`_review-YYYY-MM-DD/`) and ask.
