# Repository Guidelines

## Project Structure & Module Organization
Sankofa ships a Neovim profile in `nvim/`. Entry point `nvim/init.lua` loads modules under `lua/smithwebdev`. `core/` holds editor defaults (`settings.lua`, `keybinds.lua`, `autocmds.lua`), while `plugins/` is grouped by focus (e.g., `colorschemes/`, `navigation/`, `lsp/`). Shared helpers live in `core/utils/`. Reusable snippets live in `snippets/`. Platform-specific notes live in `welcome.md` and `NVIM_README.md`. Temporary scratch files in repo root (`test.rb`, `test.html.erb`) must stay isolated from the config.

## Build, Test, and Development Commands
- `NVIM_APPNAME=sankofa nvim` loads this profile without disturbing your default `~/.config/nvim`.
- `NVIM_APPNAME=sankofa nvim --headless "+Lazy sync" +qa` installs/updates plugins defined in `lazy.lua`.
- `NVIM_APPNAME=sankofa nvim --headless "+Lazy check" +qa` validates Lazy specs and highlights missing deps.

Run these from repo root so Lazy can resolve relative module paths.

## Coding Style & Naming Conventions
Write Lua modules under `smithwebdev.<domain>` and expose an `init.lua` when the directory has public entry points. Follow the existing 2-space indentation (`expandtab=true`, `softtabstop=2`). Prefer `snake_case` for locals and `CamelCase` only for classes/tables that act like types. Keep keymaps and plugin specs annotated with descriptive `desc` fields. Use block comments sparingly for section markers; inline comments should explain intent, not mechanics.

## Testing Guidelines
Smoke-test edits by launching `NVIM_APPNAME=sankofa nvim` and exercising affected plugins (e.g. toggle keymaps, open Telescope). Run `NVIM_APPNAME=sankofa nvim --headless "+checkhealth" +qa` after plugin or LSP changes to ensure external tooling is detected. When touching snippets, confirm expansion via LuaSnip (`:LuaSnipListAvailable`). Document manual test notes in the PR description.

## Commit & Pull Request Guidelines
Match the existing history by prefixing commits with a scoped tag in brackets, such as `[FIX]`, `[PLUG]`, or `[CHORE]`, followed by a concise imperative summary. Limit first lines to ~72 chars and group related changes per commit. Pull requests should describe the motivation, enumerate behavioral changes, link any issue, and include steps to reproduce or validate (e.g., Lazy command output, screenshots of UI tweaks). Request review before merging and ensure `lazy-lock.json` changes are intentional.

## Security & Configuration Tips
Keep API keys and local machine paths out of version control. Treat `lazy-lock.json` as the source of truth for plugin versions; update it only when testing against the new lockfile succeeds. Verify third-party plugin adds against trusted sources before landing them.
