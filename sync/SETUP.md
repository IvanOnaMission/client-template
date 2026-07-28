# Brain sync — setup (client machine, macOS)

Two directions, two mechanisms — **this is the whole sync model:**

| Direction | What | Mechanism | Cadence |
|---|---|---|---|
| **Push** (their changes → GitHub) | brain auto-saves itself | `.claude/hooks/auto-commit.sh` (PostToolUse hook) | **instant** — every write |
| **Pull** (Ivan's updates → their machine) | they pick up what Ivan pushes | `sync/git-pull.sh` via launchd | **scheduled** — every 6h |

Push is instant on purpose (never lose memory to a crash). Pull is scheduled because incoming updates aren't urgent. Conflicts are avoided by separation of duties: **Ivan edits the knowledge wiki, the agent writes per-person memory** — the two sides rarely touch the same file.

## Prerequisites (on the client's Mac)
- **Claude Code** installed (so the hooks fire — Desktop alone has no hooks).
- The repo **cloned locally** and **git authenticated** for push+pull (a GitHub PAT in the credential helper, SSH key, or `gh auth login`).
- `python3` present (the auto-commit hook uses it to parse file paths).

## Install the scheduled pull (run once, in the repo root)
```bash
chmod +x sync/git-pull.sh

REPO="$(pwd)"
sed "s|{{REPO_PATH}}|$REPO|g" sync/com.flowstate.brainpull.plist.template \
  > ~/Library/LaunchAgents/com.flowstate.brainpull.plist

launchctl load ~/Library/LaunchAgents/com.flowstate.brainpull.plist
launchctl start com.flowstate.brainpull   # test it now
cat .claude/sync.log                            # should show a pull result
```

## Change the cadence
Edit `StartInterval` (seconds) in the loaded plist. 21600 = 6h (4×/day). Reload after editing:
```bash
launchctl unload ~/Library/LaunchAgents/com.flowstate.brainpull.plist
launchctl load ~/Library/LaunchAgents/com.flowstate.brainpull.plist
```

## Uninstall
```bash
launchctl unload ~/Library/LaunchAgents/com.flowstate.brainpull.plist
rm ~/Library/LaunchAgents/com.flowstate.brainpull.plist
```
