#!/bin/bash
# skill-scout-nudge.sh — Notification hook
# Fires on compact events. When the context window is being compressed,
# the session has been long and active enough to have real workflow patterns.
# Nudge Claude to run /skill-scout to capture them.

# Only act on compact notifications
echo "$NOTIFICATION_TYPE" | grep -qi "compact" || exit 0

echo "Context was just compacted — this session has been active enough to have workflow patterns worth capturing. Run /skill-scout to analyze this session's workflow and the codebase for skill automation opportunities. Briefly summarize any suggestions to the user rather than writing a full file, since context was just compressed."
