# AGENTS.md

## Unwritten
<!-- fill per project: only what reading the repo cannot reveal. Delete any line that restates package.json, config, directory layout, or --help. -->
- Gotchas: <!-- e.g. "integration tests share one DB; run them serially" -->
- Conventions: <!-- rules no linter enforces -->
- Why: <!-- the reason behind a surprising choice, so nobody "fixes" it -->
- Off-limits: <!-- generated, vendored, or human-owned paths -->

## Pointers
- **Writing** or reviewing code: apply `CODING_STANDARDS.md`; project config and linters win where they disagree.
- **Security**-sensitive change (auth, permissions, untrusted input, secrets): read `docs/agents/security.md` first.
- **Committing** or opening a PR: follow `docs/agents/git.md`.
- **Risky** change (spans modules, migrates data, alters a public API): propose a phased plan and get approval before editing.
- **Done** means you ran the project's own check commands and they are green, or you named the ones you could not run.
