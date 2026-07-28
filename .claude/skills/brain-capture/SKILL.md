---
name: brain-capture
description: Capture durable, useful business facts that surface in conversation into the Brain (Brain 2/). Use whenever the owner or staff share something true beyond today that the business should remember — a process, a supplier, a pricing rule, a decision, a customer preference, how a job type is handled.
---

# Brain Capture

The Brain (`Brain 2/`) is this business's living memory. It should get smarter every time someone uses the system. Your job: notice durable knowledge as it comes up and write it down — the auto-commit hook persists it to the repo automatically, so once you write it, it's saved.

## The test before capturing
Ask: **"Is this true beyond today, and would the business need it again?"**
- **Yes** → capture it.
- **No** (a one-off, a passing comment, today's scheduling detail) → don't. Keep the brain clean; a junk drawer makes it worse, not better.

## What's worth capturing
Processes & SOPs · how a job type is scoped or handled · pricing rules & rates · supplier/contact details & terms · customer preferences or history · decisions and the reasoning · recurring questions + their answers · anything staff currently have to ask the owner about.

## Where it goes
Write to the matching file under `Brain 2/wiki/` (synthesised knowledge) or drop a raw note in `Brain 2/raw/` if it needs filing later. Follow the structure in `Brain 2/CLAUDE.md`:
- Update the relevant existing page rather than duplicating.
- If a fact contradicts what's there, don't silently overwrite — add it and flag the conflict.
- Keep the owner's voice and the page conventions.

## How it persists (automatic — don't run git yourself)
A `PostToolUse` hook commits + pushes the moment you write a `Brain 2/` file, and a `SessionEnd` hook sweeps anything left. You never need to commit manually — just write to the brain and it's saved + backed up to GitHub.

## Don't capture
Secrets/credentials (never), anything the owner asks you to keep private, today-only logistics, or raw chatter. When unsure whether something's durable, ask the owner: *"Want me to save that to the brain?"*
