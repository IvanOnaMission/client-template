---
name: onboard-business
description: Build the business's knowledge brain from its EXISTING materials — less meeting. Ingests their website + dropped docs/SOPs/exports and synthesises the tiered Brain 2 wiki (business, services, faq, commercials, public/about) + fills Brain 1. Run at the start of a new client setup, or when the shared/ wiki pages are still empty stubs. Trigger phrases — "build the brain", "onboard the business", "set up [business]'s brain", "ingest their stuff". Idempotent — re-run as more materials arrive.
---

## What this skill does

Builds the **business-level** brain from what the client already has, so you replace a long discovery meeting with their existing materials. It reads their website + any dropped documents, synthesises them into the tiered `Brain 2/wiki/` pages, and lists the few gaps a human still needs to confirm.

**Stay in lane — this skill does ONE thing:**
- ✅ **This skill** = build the brain (the business's knowledge) from existing material.
- ❌ **Per-person voice + triage** = run the separate `onboard-person` skill, once per team member.
- ❌ **Finding the automations / leaks (the audit)** = that's the `discovery-synthesizer` agent, not this. Don't try to find opportunities here — just capture what's true.

## Before you start
1. **Get the business name** (for `Brain 1/business.md` + page headers).
2. **Ask what materials exist** and gather them:
   - Their **website** (get the URL — you'll fetch it).
   - Any **docs**: service lists, price lists, SOPs, terms, an "about us", job-software exports, past quotes/invoices (de-identified).
3. If they have almost nothing written down, that's fine — ingest the website, then the gaps list (Step 4) becomes the short interview.

## Step 1 — Gather sources into `raw/`
Everything synthesised must trace to a source. Pull material into `Brain 2/raw/` first (it's immutable once there):
- **Website:** fetch the key pages (home, services, about, contact, FAQ) with WebFetch and save each as markdown into `Brain 2/raw/website/`. Note the fetch date.
- **Documents:** drop the client's files into `Brain 2/raw/docs/`. Read them in place (Claude Code reads PDF/text natively). *Exotic formats (DOCX/XLSX/PPTX) — convert to markdown first; flag to Ivan if a converter isn't set up.*
- List what you gathered before synthesising, so the human can see the source set.

## Step 2 — Synthesise into the tiered wiki
Follow `Brain 2/CLAUDE.md` (the schema) exactly. Fill **just-in-time, v0 first** — don't pad pages with fluff:

**v0 (do these now):**
- `wiki/shared/business.md` — what they do, owner, team, how the business runs
- `wiki/shared/services.md` — what they sell
- `wiki/shared/faq.md` — common customer questions (great source: their website FAQ)
- `wiki/shared/commercials.md` — pricing/packaging *if* the materials state it (→ likely `admin/` or `owner/` tier if sensitive)
- `wiki/public/about.md` — the customer-safe overview
- `Brain 1/business.md` — the one-paragraph at-a-glance + key people

**Rules (from the schema — non-negotiable):**
- **Cite every claim:** `(source: [[raw/website/services]])` etc.
- **Never invent.** If the materials don't say it, it's a **gap** (Step 4) — do NOT guess. A wrong fact in a long-lived brain is worse than a blank.
- **Tag each page's tier** as you write it (public / shared / admin / owner). Default `shared/`; promote anything sensitive (margins, financials, staff/HR) up. See `wiki/ACCESS-MODEL.md`.
- **One topic per file**, plain markdown, owner's voice where you can infer it.
- If a new source contradicts an existing page, **don't overwrite — flag** `⚠️ Contradicts [[raw/...]]`.
- Update `index.md` (catalog the pages) + append to `log.md`.

## Step 3 — Fill Brain 1
- `Brain 1/business.md` — at-a-glance (who, what, key people, how they make money).
- `Brain 1/boundaries.md` — draft the always-on safety rules (never auto-send, never invent, escalate complaints/legal/large $). Confirm with the owner before any agent goes live.

## Step 4 — Output the gaps list (this replaces the meeting)
End with a **short** list of what the materials couldn't tell you — the only things a human needs to confirm. Keep it tight (the point is less meeting, not a 30-question form). Typically: team size + who does what, anything pricing/financial not public, how a job flows through their software, and the boundaries to confirm. Hand this list to Ivan to check with the owner.

## When you're done
- State which pages you created/updated and their tiers.
- Remind: run **`onboard-person`** for each team member (voice + triage), and the **audit** (`discovery-synthesizer`) to find the automations — those are separate.
- The auto-commit hook persists everything; you don't run git.

## Rules
- **Idempotent** — re-run as more materials arrive. Edit/extend existing pages, don't duplicate. Don't re-fetch a source already in `raw/` unless it's changed.
- **Never write credentials** anywhere. Access status only, in `wiki/admin/access-tracker.md`.
- When unsure whether something's true or which tier it belongs in, **ask — don't guess.**
