---
name: onboard-person
description: Interview a new team member and fill in their per-person folder (memory.md, voice.md, triage.md, log.md). Runs on first use for anyone whose people/{name}/ folder is missing or still has [Person Name] placeholders. Trigger phrases — "set me up", "onboard me", "let's get started", "fill in my details", or a fresh person with an empty folder. Idempotent — re-run any time to fill gaps.
---

## What this skill does

Conducts a short, friendly interview with ONE team member and writes their answers into their own folder at `Brain 2/wiki/people/{firstname}/`. By the end, the AI knows who they are, how they write, how to sort their inbox, and what never to do for them — so the system feels like *theirs* from day one instead of generic.

This is the thing that fills the template. Without it, `people/{name}/` sits half-blank and the AI guesses. Run it once per person.

## Before you start

1. **Get their first name.** The folder is `Brain 2/wiki/people/{firstname}/` (lowercase).
2. **If the folder doesn't exist:** copy `Brain 2/wiki/people/_TEMPLATE/` → `Brain 2/wiki/people/{firstname}/`.
3. **Check what's already filled.** Read their `memory.md`, `voice.md`, `triage.md`. Skip any section that already has real content (not `[Person Name]` / blank). Tell them what you'll skip: *"Looks like your voice is already set — I'll skip that. Let's do the rest."*
4. **Set the tone.** Plain, quick, no corporate. *"Few quick questions so I actually work like you'd want — takes about 5 minutes. Go as short as you like."*

## How to run it

Ask **one question at a time.** Write each answer into the right file **as you go** (so nothing's lost if they stop halfway). Don't dump all questions at once. Keep it conversational — react to answers, don't just march through a form.

---

### Part A → fills `memory.md`

1. **"What's your role here, and what do you actually do day-to-day?"** → *Role & responsibilities*
2. **"What are you working on right now — anything live or ongoing?"** → *Current focus / open threads*
3. **"How do you want me to work with you? Draft everything and you check it, or ask first? Formal or casual? Anything that'd annoy you?"** → *Preferences*
4. **"What's the repetitive stuff that eats your time each week?"** → *Recurring tasks* (this is gold — it's where the next automation comes from; note anything done often)
5. **"Anything I should just always know about you or your patch?"** → *Standing facts*
6. **"Anything I should NEVER do for you?"** → *Do NOT* (take this seriously — it's a safety list)

### Part B → fills `voice.md`

7. **"Paste me 10–20 of your real sent messages — emails, texts, whatever. Don't write new ones, paste the actual ones."**
   - **Hard rule — they must PASTE, not type fresh.** If they start writing new prose, stop them:
     > *"Don't write them fresh — paste the real ones. If you type them now they come out polished and it won't sound like you. Open your sent folder and copy-paste the raw text. This is the one I can't fake."*
   - Paste raw, no edits. This is the voice fingerprint.
8. **"Default greeting and sign-off?"** and **"Texts — formal or casual, emojis or no?"** → greeting / sign-off / SMS style fields.

### Part C → fills `triage.md` *(only if this person's inbox is being triaged — ask first: "Am I sorting your inbox? If not we skip this.")*

9. **"What's a drop-everything email for you?"** → 🔴 Red
10. **"What's same-day-but-not-urgent?"** → 🟠 Orange
11. **"What's noise you don't need to see?"** → 🟢 Green
12. **"Anyone who should always get straight through to you?"** → VIP list
13. **"Where do urgent alerts go — what number?"** → SMS recipient
14. **"Anything I must flag to a human and never answer myself?"** (complaints, legal, press, big invoices) → escalate-never-draft list

---

## When you're done

1. **Start their `log.md`** with: `## [today's date] folder created — onboarded via interview`
2. **Update `memory.md`** footer: `_Last updated by the AI: [today's date]_`
3. **Never write credentials** into any file. Passwords/tokens go in the proper secrets store, never the brain.
4. **Close warm:** *"Done — I know how you work now. Just talk to me normally and I'll keep learning as we go."*

## Rules

- **Edit, don't append.** If re-run, rewrite stale answers in `memory.md` — don't stack contradictions. (Full pattern: `Brain 2/wiki/people/README.md`.)
- **One person per run.** Each person's folder is private — never read another person's folder into this session.
- **Write only to this person's folder.** Nothing else.
