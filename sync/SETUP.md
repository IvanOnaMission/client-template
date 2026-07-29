# Brain sync — setup (client machine, macOS or Windows)

Two directions, two mechanisms — **this is the whole sync model:**

| Direction | What | Mechanism | Cadence |
|---|---|---|---|
| **Push** (their changes → GitHub) | brain auto-saves itself | `.claude/hooks/auto-commit.sh` (PostToolUse hook) | **instant** — every write |
| **Pull** (Ivan's updates → their machine) | they pick up what Ivan pushes | `sync/git-pull.sh` (macOS, launchd) or `sync/git-pull.ps1` (Windows, Task Scheduler) | **scheduled** — every 6h |

Push is instant on purpose (never lose memory to a crash). Pull is scheduled because incoming updates aren't urgent. Conflicts are avoided by separation of duties: **Ivan edits the knowledge wiki, the agent writes per-person memory** — the two sides rarely touch the same file.

## Prerequisites (both OSes)
- **Claude Code** installed (so the hooks fire — Desktop alone has no hooks).
- The repo **cloned locally** and **git authenticated** for push+pull (`gh auth login` is the easy path — see the main [`SETUP.md`](../SETUP.md) step 3).
- **Python on PATH** (the auto-commit hook uses it). macOS has `python3` already; on Windows install Python and confirm `python --version` works — the hook accepts either name.

---

## macOS — install the scheduled pull (run once, Terminal, in the repo root)

```bash
chmod +x sync/git-pull.sh

REPO="$(pwd)"
sed "s|{{REPO_PATH}}|$REPO|g" sync/com.flowstate.brainpull.plist.template \
  > ~/Library/LaunchAgents/com.flowstate.brainpull.plist

launchctl load ~/Library/LaunchAgents/com.flowstate.brainpull.plist
launchctl start com.flowstate.brainpull   # test it now
cat .claude/sync.log                       # should show a pull result
```

**Change the cadence:** edit `StartInterval` (seconds) in the loaded plist. 21600 = 6h (4×/day). Reload after editing:
```bash
launchctl unload ~/Library/LaunchAgents/com.flowstate.brainpull.plist
launchctl load ~/Library/LaunchAgents/com.flowstate.brainpull.plist
```

**Uninstall:**
```bash
launchctl unload ~/Library/LaunchAgents/com.flowstate.brainpull.plist
rm ~/Library/LaunchAgents/com.flowstate.brainpull.plist
```

---

## Windows — install the scheduled pull (run once, PowerShell, in the repo root)

Uses the built-in **Task Scheduler** — no extra software. `sync/git-pull.ps1` is the
PowerShell twin of the macOS script (same behaviour, same log file).

```powershell
$Repo = (Get-Location).Path
schtasks /Create /TN "FlowState Brain Pull" /SC HOURLY /MO 6 `
  /TR "powershell -NoProfile -ExecutionPolicy Bypass -File \"$Repo\sync\git-pull.ps1\"" /F

schtasks /Run /TN "FlowState Brain Pull"      # test it now
Get-Content .claude\sync.log -Tail 5           # should show a pull result
```

Notes:
- `/MO 6` = every 6 hours. Change the number to change the cadence.
- The task runs as the logged-in user, so it uses the same git login you set up in step 3
  of the main `SETUP.md`. If the log shows an auth error, re-run `gh auth login` (in Git Bash).
- If `.claude\sync.log` stays empty, open Task Scheduler (search the Start menu), find
  "FlowState Brain Pull" → Last Run Result should be `0x0`.

**Uninstall:**
```powershell
schtasks /Delete /TN "FlowState Brain Pull" /F
```
