# Pull the latest brain from GitHub (Windows twin of git-pull.sh).
# Runs on a schedule via Task Scheduler so the client's local copy picks up
# updates Ivan pushes. Safe alongside the auto-commit hook: that hook pushes
# every brain write instantly, so this normally just fast-forwards.
# Always exits 0 so a network blip never wedges the schedule.

$RepoDir = Split-Path -Parent $PSScriptRoot
Set-Location $RepoDir
$Log = Join-Path $RepoDir ".claude\sync.log"
Add-Content -Path $Log -Value "[$(Get-Date)] pulling..."
git pull --rebase --autostash origin main 2>&1 | Add-Content -Path $Log
exit 0
