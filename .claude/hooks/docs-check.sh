#!/bin/bash
# docs-check.sh — PostToolUse hook for Bash
# Fires after every Bash tool use. If a git commit just happened and
# code changed without any documentation updates, nudges Claude to check.

# Only act on git commit commands
echo "$TOOL_INPUT" | grep -q "git commit" || exit 0

# Need at least 2 commits to diff
git rev-parse HEAD~1 &>/dev/null || exit 0

changed=$(git diff HEAD~1 --name-only 2>/dev/null)
[ -z "$changed" ] && exit 0

code_files=$(echo "$changed" | grep -cvE '\.(md|txt)$|^docs/' 2>/dev/null || echo "0")
doc_files=$(echo "$changed" | grep -cE '\.(md|txt)$|^docs/' 2>/dev/null || echo "0")

if [ "$code_files" -gt 0 ] && [ "$doc_files" -eq 0 ]; then
  echo "Docs check: code was committed without documentation updates. Verify if README, docs/, or architecture files need updating to reflect these changes."
fi
