# Shared tier

**Default tier for internal business knowledge.** Anyone authenticated as part of the business — staff, admin, owner — can read this.

Most files in the brain start here. Promote to a higher tier (`admin/` or `owner/`) only when content sensitivity demands it.

## What goes here

- How the business runs day-to-day
- Customer journey from lead to job complete
- Decision rules for jobs and quotes
- Operations and workflow
- AI boundaries (what the AI should never do)
- Existing tech stack and integrations
- Supplier and partner relationships (non-pricing)
- General business basics

## What does NOT belong here

- Customer financial info → `admin/`
- Per-person triage rules → `people/` (admin-tier in practice)
- Margins, profit, HR notes → `owner/`
- Anything customer-facing → `public/`

## Used by

All internal agents. The default reading scope when an authenticated user connects to any internal AIOS module.

See `Brain 2/wiki/ACCESS-MODEL.md` for the full model.
