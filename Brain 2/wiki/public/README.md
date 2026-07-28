# Public tier

**Anything in this folder is fair game to expose to a customer-facing chatbot, the client's website, or any unauthenticated user.**

The test: *would you happily print this on a billboard outside their shop?* If no, it doesn't belong here.

## What goes here

- Services offered
- Hours / availability
- Location / service area
- Booking process
- Public-facing FAQ
- About / company story (the marketing version)

## What does NOT go here

- Pricing structures (unless already public on their website)
- Customer info of any kind
- Internal processes
- Supplier names or pricing
- Anything financial
- Anything an employee would not want a competitor to see

## Used by

Customer-facing agents only. Internal agents read from `shared/` (and up). Public-facing agents must be configured to read ONLY from `public/` — never broaden their scope to other tiers.

See `Brain 2/wiki/ACCESS-MODEL.md` for the full model.
