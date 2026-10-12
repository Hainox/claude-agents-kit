# claude-agents-kit

Claude Code marketplace with one plugin, `agents-kit`:

- `/agents-init` — installs or merges `AGENTS.md`, `CLAUDE.md` (`@AGENTS.md`), `CODING_STANDARDS.md`, `docs/agents/{security,git}.md` and fills the project's Unwritten slots.
- SessionStart hook — when the project has no `AGENTS.md`, tells the agent to offer `/agents-init`. Prints only; never writes.

## Enable in a repo (cloud and local sessions)

`.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "agents-kit": { "source": { "source": "github", "repo": "Hainox/claude-agents-kit" } }
  },
  "enabledPlugins": { "agents-kit@agents-kit": true }
}
```

## Enable on a machine (all local folders)

```bash
claude plugin marketplace add Hainox/claude-agents-kit
claude plugin install agents-kit@agents-kit
```

Folders without git count as projects under `AGENTS_KIT_ROOTS` (colon-separated; default `~/Claude/Projects`).
