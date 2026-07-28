# Brain — Access Model

The brain is split into tiers so the right people (and the right agents) see the right things. This matters the moment the business has more than one user, and it matters even more if any agent is ever exposed to customers or the public.

## The four tiers

| Tier | Who can read | What goes in it |
|---|---|---|
| `public/` | Anyone — including customers, website visitors, unauthenticated users | Services, hours, location, public FAQ, booking process. Anything you'd happily print on a billboard. |
| `shared/` | Internal — any authenticated user (staff, admin, owner) | Default tier. How the business runs, customer journey, operations, AI boundaries, decision rules. Most knowledge starts here. |
| `admin/` | Admin + owner only | Sensitive operational content. Invoicing rules, customer financial info, per-person triage rules, supplier pricing, access tracker. |
| `owner/` | Owner only | Most sensitive. Financials, margins, HR notes, strategic decisions, confidential partnerships. |

`people/` (per-team-member voice + triage) sits at the brain root for organisational reasons, but treat its contents as **admin-tier in practice** — staff shouldn't read other staff's voice or inbox rules.

## How to use this in builds

**For single-user builds (e.g. just the owner on local Claude Code):**
The tier separation is anticipatory — you can leave everything in `shared/` because there's only one reader anyway. The folders are there so future tiers don't require a restructure.

**For multi-user internal builds (owner + admin + staff):**
The agent identifies who's connecting and loads only the folders that role can see. Office assistant → `shared/` only. Admin → `shared/` + `admin/`. Owner → all internal tiers.

**For customer-facing agents (public chatbots, website widgets):**
**A separate agent with a separate brain.** It reads from `public/` ONLY. It must not have tool access that could pull from any other tier. This is defence in depth — if it can't see internal content, it can't leak it.

## Promotion rules — when to move a file up a tier

Default everything to `shared/` when filling out the brain. Promote to a more restrictive tier when:

- The file contains numbers a competitor could weaponise → `owner/`
- The file contains customer financial or personal information → `admin/`
- The file contains team-specific or HR-related content → `owner/`
- The file is suitable to expose to customers → copy to `public/` (keep the internal version in `shared/` if needed)

Promotion is cheap (move the file, update any references). The cost of NOT promoting and getting it wrong is a privacy incident.

## Rules

- Never put credentials in any tier. `admin/access-tracker.md` tracks status only.
- `public/` is the only tier that should ever be exposed to a non-authenticated agent.
- When in doubt, promote up — over-restriction is recoverable, leakage is not.
