#!/bin/bash
# Pull the latest brain from GitHub. Runs on a schedule (launchd, a few times a day)
# so the client's local copy picks up updates Ivan pushes.
#
# Safe alongside the auto-commit hook: that hook commits + pushes every brain write
# instantly, so the working tree is normally clean and this just fast-forwards remote
# changes in. --autostash protects any uncommitted edit; --rebase keeps history linear
# (no merge commits). Conflicts are near-impossible by design — Ivan edits the knowledge
# wiki, the agent writes per-person memory, so the two sides rarely touch the same file.
# Always exits 0 so a transient network blip never wedges the schedule.

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR" || exit 0
echo "[$(date)] pulling..." >> ".claude/sync.log"
git pull --rebase --autostash origin main >> ".claude/sync.log" 2>&1
exit 0
