# Setup — standing up a client's AI Operating System

This repo is the template for a Flowstate client's **AI Operating System (AIOS)** — the
brain and agents that make a business readable and workable by AI. This page is the ONE
setup path, in order, copy-paste-able. It's written for Ivan setting up a client machine
(often a Windows PC), but a reasonably comfortable-with-computers person can follow it too.

> Want the concepts first? [`README.md`](README.md) explains the two-brain model.

---

## 1. Install the prerequisites (on the client's machine)

| Tool | Why | Get it |
|---|---|---|
| **Git** | The brain saves and syncs through GitHub | macOS: `xcode-select --install` in Terminal · Windows: [Git for Windows](https://git-scm.com/download/win) — **required**, it includes Git Bash which the auto-save hooks need. Accept the defaults. |
| **GitHub account** | Holds the private repo | [github.com/signup](https://github.com/signup) — the client's own account (they own their brain) |
| **GitHub CLI (`gh`)** | Easiest login + repo creation | [cli.github.com](https://cli.github.com) |
| **Claude Code** | The brain runs here — auto-save hooks ONLY fire in Claude Code (Desktop has no hooks) | [claude.com/claude-code](https://claude.com/claude-code) |
| **Python** | The auto-save hook uses it to read file paths | macOS: already installed. Windows: [python.org/downloads](https://www.python.org/downloads/) — **tick "Add python.exe to PATH"** in the installer. |
| **Obsidian** *(optional)* | Browse the brain like a nice notes app | [obsidian.md](https://obsidian.md) |

**Windows note:** the command `python3` does not exist on Windows — it's `python` there.
The hooks in this repo handle both automatically; just make sure `python --version` works
in a fresh terminal.

## 2. Create the client's repo from this template

This repo is a **GitHub template** — don't fork or copy folders. One command (run on
Ivan's machine or anywhere `gh` is logged in to the right account):

```bash
gh repo create FlowState-clients/acme-electrical \
  --template IvanOnaMission/client-template --private
```

Swap `acme-electrical` for the client's business name (lowercase, hyphens). **Private**,
under the `FlowState-clients` account — that's the standing convention.

Then add the client as a collaborator so it's theirs to access:

```bash
gh api -X PUT repos/FlowState-clients/acme-electrical/collaborators/THEIR-GITHUB-USERNAME -f permission=push
```

*(No `gh`? On github.com: this repo → "Use this template" → "Create a new repository" →
owner `FlowState-clients`, visibility Private. Then Settings → Collaborators → add them.)*

## 3. Clone it on the client's machine and log in

Open **Terminal** (macOS) or **Git Bash** (Windows):

```bash
gh auth login          # choose GitHub.com → HTTPS → login with browser (the CLIENT's account)
cd ~                   # home folder is fine on both OSes
gh repo clone FlowState-clients/acme-electrical
cd acme-electrical
git push               # should say "Everything up-to-date" — proves push access works
```

If `git push` asks for a password, `gh auth login` didn't finish — run it again.

**Windows traps (bake these in now, they fail silently later):**
- **No symlinks.** This template contains none on purpose — on Windows, git symlinks
  arrive as useless text files. If you ever add files to a client repo, never use symlinks.
- **Line endings** are enforced by `.gitattributes` (shell scripts stay LF). Don't edit
  the `.sh` files with Notepad; if a script ever misbehaves, re-clone rather than hand-fix.
- Use `python`, not `python3`, in anything you add.

## 4. Know the placeholders (most are filled FOR you)

The complete list of placeholders in this template:

| Placeholder | Where | Who fills it |
|---|---|---|
| `[Business Name]` | `CLAUDE.md`, `Brain 1/` files, `Brain 2/` headers | the **`onboard-business`** skill (step 5) |
| `[Owner Name]` | `Brain 1/context.md` | `onboard-business` |
| `[Person Name]` | `Brain 2/wiki/people/_TEMPLATE/` | the **`onboard-person`** skill, per team member |
| `[YYYY-MM-DD]` | `Brain 1/now.md`, `Brain 2/log.md` | whichever skill touches the file |
| Bracketed prompts like `[what they do — one line]` | throughout Brain 1 + wiki stubs | the skills, as material arrives |
| `{{REPO_PATH}}` | `sync/com.flowstate.brainpull.plist.template` | the sync install command (step 7) — never by hand |

Don't hand-edit files to chase placeholders — run the skills and let them do it.
Leftover placeholders are a to-do list, not a fault.

## 5. First open in Claude Code — run the onboarding, in this order

In the repo folder, run `claude`. It reads `CLAUDE.md` automatically (everything will
say `[Business Name]` until onboarding — expected). Then:

1. **`onboard-business`** — say *"build the brain"*. It ingests their website + any docs
   into `Brain 2/wiki/`, fills `Brain 1/context.md` (including **decision rights** — what
   the AI may do without asking) and `Brain 1/boundaries.md`, and ends with a short gaps
   list. **Sit with the owner and confirm decision rights + boundaries before any agent
   goes live** — those two are the owner's call, not defaults.
2. **`onboard-person`** — once per team member who'll use the system (their voice, triage
   rules, running memory). Or let it trigger itself: it runs automatically the first time
   a new person starts a session.
3. **`brain-capture`** — nothing to run now; it's the day-to-day skill that files new
   facts into the wiki as they come up in conversation.

Re-run `onboard-business` any time more materials arrive — it's safe to repeat.

## 6. Open the brain in Obsidian (optional, but clients like it)

Obsidian → **Open folder as vault** → pick the repo folder (e.g. `acme-electrical`).
Browse `Brain 2/wiki/` — every page is plain markdown, edits are picked up like any
other change.

## 7. Turn on sync

Two directions:
- **Push (auto-save) — already on.** The hooks in `.claude/` commit + push every brain
  write instantly. Nothing to install; you'll verify it below.
- **Pull (Ivan's updates → this machine) — install the schedule** by following
  [`sync/SETUP.md`](sync/SETUP.md). It has both paths: **macOS** (launchd) and
  **Windows** (Task Scheduler + the PowerShell script `sync/git-pull.ps1`).

## 8. You know it worked when… (verification checklist)

Run through ALL of these before leaving the machine:

- [ ] **Claude Code greets with the business name** — open `claude` in the repo and ask
  *"who is this business?"* It should answer with their real name and one-liner, not
  `[Business Name]`.
- [ ] **Boundaries stick** — ask *"what are you not allowed to do?"* It should recite the
  confirmed boundaries + decision rights.
- [ ] **Auto-save works** — ask Claude to note a test fact in the brain, then check
  github.com → the repo → a commit `brain: auto-capture …` appeared within a minute.
- [ ] **Obsidian shows the wiki** (if installed) — `Brain 2/wiki/business.md` has real content.
- [ ] **Scheduled pull works** — after installing sync, run the "test it now" command in
  `sync/SETUP.md` and check `.claude/sync.log` shows a pull result.

If any box fails, fix it before you leave — the traps in step 3 cover the usual Windows causes.

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
