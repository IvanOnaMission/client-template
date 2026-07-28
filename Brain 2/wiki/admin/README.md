# Admin tier

**Admin + owner only.** Not for general staff. Sensitive operational content that an office manager or admin lead handles, but a tradie on a job site doesn't need.

## What goes here

- Invoicing rules and chase logic
- Customer financial info (outstanding balances, payment terms)
- Customer comms templates (the actual wording sent under the business's voice)
- Supplier pricing where commercially sensitive
- Per-person triage rules (typically — though `people/` lives at the brain root for organisation)
- Access tracker — what credentials exist and where (status only, never the credentials themselves)
- Any process that involves money or sensitive customer data

## What does NOT belong here

- General how-we-operate → `shared/`
- Owner-only financials and margins → `owner/`
- Customer-facing content → `public/`

## Used by

Agents acting on behalf of admin or owner roles. Layla's email triage and invoicing agents read here. Customer-facing agents do NOT read here.

See `Brain 2/wiki/ACCESS-MODEL.md` for the full model.
