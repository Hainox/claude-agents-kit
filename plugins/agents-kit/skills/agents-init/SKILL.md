---
name: agents-init
description: Install or update the universal AGENTS.md / CODING_STANDARDS.md set in the current project and fill its Unwritten slots. Use when a project lacks AGENTS.md, its AGENTS.md predates this structure, or the user asks to init, add, update, or set up agent instructions.
---

Templates live in `templates/` next to this file (AGENTS.md, CLAUDE.md, CODING_STANDARDS.md, docs/agents/*.md).

1. **Root.** Resolve the project root: the git toplevel, unless that is the home directory; then the current working directory. Confirm it with the user if ambiguous.
2. **Copy.** Copy every template file the root lacks, preserving `docs/agents/`. If `CLAUDE.md` exists without `@AGENTS.md`, append that line. Done when every template file exists in the root.
3. **Merge**, when AGENTS.md (or CLAUDE.md beyond the import line) already existed: keep every project-specific fact (commands with gotchas, workflow permissions such as who may merge PRs, deploy/server notes, domain terms) and sort each into an Unwritten slot or a new project heading; drop generic advice that `CODING_STANDARDS.md` or the model's defaults already cover. Done when each line of the old file is either placed or listed in the report as dropped, with a reason.
4. **Fill.** Investigate the repo (README, configs, scripts, CI, git log, existing docs) and replace each remaining `<!-- ... -->` slot under `## Unwritten` with facts the agent cannot discover by reading config alone. Delete any slot with nothing true to say. Done when no `<!--` remains in AGENTS.md.
5. **Prune.** Remove rules in CODING_STANDARDS.md that contradict the project's linter, configs, or established code, and replace the generic Commits rule in `docs/agents/git.md` with the convention `git log` actually shows (language, prefixes, branch naming); drop lines a commitlint/PR template already covers, and the file itself when there is no git repo. Your own commit, branch, and PR title for this change follow that same convention.
6. **Report** the files created, merged, and skipped, every filled slot, and every dropped line, so the user can correct guesses.
