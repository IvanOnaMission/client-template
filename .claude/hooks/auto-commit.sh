#!/bin/bash
# Auto-capture: commit + push a brain file the moment Claude writes/edits it.
# Fires from PostToolUse (Write|Edit|MultiEdit). Commit-on-capture, NOT on session
# end — so nothing is lost on a crash or force-quit. Always exits 0 (never blocks).
#
# Safety: only ever touches files under "Brain 2/" (the knowledge brain). Code,
# config, and secrets (.env is gitignored anyway) are never staged by this hook.

INPUT=$(cat)

# Pull the edited file path out of the hook's stdin JSON (python3 ships on macOS;
# the repo already runs python for triage, so it's a safe dependency).
FILE_PATH=$(printf '%s' "$INPUT" | python3 -c \
  "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null)
[ -z "$FILE_PATH" ] && exit 0

# Only persist changes inside the brain. Note the space in "Brain 2".
case "$FILE_PATH" in
  *"/Brain 2/"*) ;;
  *) exit 0 ;;
esac

cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0

# Stage ONLY the brain file that changed, then commit + push if there's a real change.
git add "$FILE_PATH" 2>/dev/null
if ! git diff --cached --quiet 2>/dev/null; then
  rel="${FILE_PATH#$CLAUDE_PROJECT_DIR/}"
  git commit -q -m "brain: auto-capture ${rel}" 2>/dev/null
  git push -q origin HEAD 2>/dev/null
fi

exit 0
