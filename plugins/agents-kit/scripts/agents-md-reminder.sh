#!/usr/bin/env bash
# SessionStart: remind the agent to run /agents-init when the project has no
# AGENTS.md. Only prints; never writes into the project.
#
# A folder counts as a project when it is its own git toplevel (not $HOME, which
# may itself be a repo) or sits under AGENTS_KIT_ROOTS (colon-separated, default
# ~/Claude/Projects) for folders without git. Everything else stays silent, so
# scratch sessions get no noise.

dir="${CLAUDE_PROJECT_DIR:-$PWD}"
command -v cygpath >/dev/null 2>&1 && dir="$(cygpath -u "$dir")"
home="$HOME"

project=""
top="$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null)"
command -v cygpath >/dev/null 2>&1 && [ -n "$top" ] && top="$(cygpath -u "$top")"
if [ -n "$top" ] && [ "$top" != "$home" ]; then
  project="$top"
else
  IFS=':' read -r -a roots <<< "${AGENTS_KIT_ROOTS:-$home/Claude/Projects}"
  for root in "${roots[@]}"; do
    case "$dir/" in
      "$root"/*/*)
        rel="${dir#"$root"/}"
        project="$root/${rel%%/*}"
        break
        ;;
    esac
  done
fi

if [ -n "$project" ] && [ ! -f "$project/AGENTS.md" ]; then
  echo "Project $project has no AGENTS.md. Offer the user to run /agents-init before starting work."
fi
exit 0
