# claude-agents-kit

Claude Code marketplace with one plugin, `agents-kit`:

- `/agents-init` — installs or merges `AGENTS.md`, `CLAUDE.md` (`@AGENTS.md`), `CODING_STANDARDS.md`, `docs/agents/{security,git}.md` and fills the project's Unwritten slots.
- SessionStart hook — when the project has no `AGENTS.md`, tells the agent to offer `/agents-init`. Prints only; never writes.

## Enable on a machine (all local folders)

```bash
claude plugin marketplace add Hainox/claude-agents-kit
claude plugin install agents-kit@agents-kit
```

Folders without git count as projects under `AGENTS_KIT_ROOTS` (colon-separated; default `~/Claude/Projects`).

## Cloud sessions

Cloud sessions do not install plugins, neither from your user settings nor from a repo's
`enabledPlugins` / `extraKnownMarketplaces` ([docs](https://code.claude.com/docs/en/cloud-environments#what-carries-over-from-your-setup)).
They do load a repo's `CLAUDE.md`/`AGENTS.md` and skills enabled on claude.ai, so:

- the instruction files work in the cloud once `/agents-init` has committed them;
- to run `/agents-init` itself in the cloud, upload `plugins/agents-kit/skills/agents-init/` as a skill on claude.ai.
