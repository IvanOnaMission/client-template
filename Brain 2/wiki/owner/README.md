# Owner tier

**Owner only.** Most sensitive content. Never exposed to staff, admin, or customers. If this leaks, real damage.

## What goes here

- Financials — revenue, costs, profit, margins
- Strategic decisions and direction
- HR notes — staff performance, hiring plans, terminations
- Confidential partnerships or negotiations in progress
- Anything legally or commercially confidential
- Personal goals or business plans the owner wants the AI to know but no one else

## What does NOT belong here

- Operational content other people need → `shared/` or `admin/`
- Per-person triage / voice → `people/`

## Used by

Only the owner's authenticated session. No customer-facing agent, no staff-tier session, no admin-tier session should ever load files from here.

## Reality check

If you're filling this folder up early in the engagement, ask: does the owner actually want the AI to know this? Some owners are happy for it; others don't want it in the brain at all. Better to leave files out than to include them and have them surface in the wrong context.

See `Brain 2/wiki/ACCESS-MODEL.md` for the full model.
