#!/bin/bash
# Backstop sweep: on session end, commit + push any brain changes the per-write
# hook missed. Runs from SessionEnd. Always exits 0. Brain-only, like auto-commit.

cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0

# Stage only changes under the brain.
git add "Brain 2" 2>/dev/null
if ! git diff --cached --quiet 2>/dev/null; then
  git commit -q -m "brain: session-end capture sweep" 2>/dev/null
  git push -q origin HEAD 2>/dev/null
fi

exit 0
