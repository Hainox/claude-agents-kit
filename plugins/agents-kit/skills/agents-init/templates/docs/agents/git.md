# Git and PRs

## Before committing

Run the checklist in `docs/agents/security.md` against the staged changes.

## Commits

Write like the history: read `git log --oneline -20` and the branch names, then
match their language, prefixes, scope, and branch naming. Fall back to
conventional commits (`<type>: <description>`; `feat`, `fix`, `refactor`,
`docs`, `test`, `chore`, `perf`, `ci`) only when the history shows no
convention. A commitlint config or PR template wins over both.

## Pull requests

Title the PR in the same style as commit subjects: a squash merge turns it into
the commit. Write the summary from the whole branch (`git log <base>..HEAD`),
not just the last commit, and end it with a test plan: what you ran and what a
reviewer should check by hand.
