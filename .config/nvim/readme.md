# Neovim Configuration

A minimal, personal Neovim setup built from scratch with **Lazy.nvim** as the plugin manager.

The goal is not to recreate LazyVim. It's to have an IDE-like workflow while keeping the configuration small, understandable, and under my control.

## Philosophy

* **Native Neovim first** — use built-in commands and functionality whenever possible.
* **Plugins only when they add real value.**
* **No giant starter template.**
* **No unnecessary keymaps.**
* **Explicit configuration over magic.**
* **IDE-like productivity without hiding how Neovim works.**
* Keep external tools external when they make more sense there.

---

## Stack

### Languages

* TypeScript / JavaScript
* React
* Node.js
* SQL / PostgreSQL / PL/pgSQL

### Tooling

* **Lazy.nvim** — plugin manager
* **Mason.nvim** — LSP/tool installation
* **nvim-lspconfig** — LSP configuration
* **Prettier** — JS/TS/etc. formatting
* **sql-formatter** — SQL formatting
* **ripgrep** — project search
* **Git** — version control

---

## Plugins

| Plugin             | Purpose                     |
| ------------------ | --------------------------- |
| `lazy.nvim`        | Plugin management           |
| `nvim-lspconfig`   | LSP configuration           |
| `mason.nvim`       | Install/manage LSP servers  |
| `telescope.nvim`   | File and project search     |
| `nvim-treesitter`  | Syntax highlighting/parsing |
| `neo-tree.nvim`    | File explorer               |
| `nvim-cmp`         | Completion                  |
| `conform.nvim`     | Formatting                  |
| `gitsigns.nvim`    | Git changes/hunks           |
| `bufferline.nvim`  | Open buffers                |
| `gruvbox-material` | Colorscheme                 |

The configuration intentionally avoids adding plugins for functionality Neovim already provides.

---

## Key Workflows

### Files

**Neo-tree**

```text
\       Open/focus file tree
```

Window navigation remains native-style:

```text
Ctrl-h  Focus left
Ctrl-l  Focus right
Ctrl-j  Focus below
Ctrl-k  Focus above
```

### Buffers

```text
Shift-h  Previous buffer
Shift-l  Next buffer

Space bd  Delete/close buffer
Space bw  Save and close buffer
```

Native commands are still available:

```vim
:bd
:bd!
:w
:q
```

### Search

Telescope is used for fuzzy/project search:

```text
Space sf  Search files
Space sg  Search project
Space sb  Search buffers
Space sw  Search current word
```

`rg` powers project-wide text search.

---

## LSP

LSP provides:

* Diagnostics
* Completion
* Hover information
* Rename
* Go to definition
* References
* Semantic navigation

Native Neovim mappings are preferred wherever available.

For example:

```text
gd   Go to definition
grn  Rename
grr  References
gl   Show diagnostic
[d   Previous diagnostic
]d   Next diagnostic
```

Diagnostics are intentionally kept quiet:

* No inline diagnostic messages
* Errors/warnings appear in the sign column
* `gl` shows details when needed
* `<leader>xx` opens diagnostics in the quickfix list

---

## Formatting

Formatting happens automatically on save.

```text
Ctrl-s
   ↓
format
   ↓
save
```

### JavaScript / TypeScript

Uses **Prettier**.

### SQL / PostgreSQL

Uses **sql-formatter**.

No ESLint integration is intentionally configured.

Manual formatting is still available through the existing formatting command.

---

## Git

Gitsigns provides lightweight Git integration directly in the editor.

```text
[h       Previous hunk
]h       Next hunk

Space hp Preview hunk
Space hs Stage hunk
Space hr Reset hunk
```

Git operations such as commits, rebases, merges, and pushes are intentionally left to the external terminal.

---

## Configuration Structure

The configuration is organized by responsibility:

```text
nvim/
├── init.lua
├── lazy-lock.json
│
└── lua/
    ├── config/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── autocmds.lua
    │
    └── plugins/
        ├── ...
        ├── formatting.lua
        ├── gitsigns.lua
        └── colorscheme.lua
```

### `config/`

Core Neovim behavior:

* Options
* Keymaps
* Autocommands

### `plugins/`

One configuration file per plugin or logical plugin group.

This makes it easy to answer:

> "Why is this plugin here?"

If there's no good answer, it probably doesn't belong.

---

## UI

The default colorscheme is **Gruvbox Material**.

The UI is intentionally restrained:

* Dark Gruvbox Material
* Soft background
* Subtle cursorline
* Relative line numbers
* Persistent sign column
* Rounded diagnostic floats
* Minimal status information
* No excessive animations or visual noise

The goal is **clean IDE-like presentation without turning Neovim into a dashboard**.

---

## Windows

This configuration targets **Windows + PowerShell**.

The terminal is intentionally **not embedded in Neovim**.

For terminal work, use the external PowerShell terminal.

This keeps Neovim focused on editing rather than duplicating the terminal workflow.

---

## Design Rule

When adding something new, ask:

> **Does Neovim already do this?**

If yes, prefer the native behavior.

If no:

> **Does this plugin solve a problem I actually have?**

If yes, add it.

Otherwise, don't.

The goal is not maximum plugins or maximum configuration.

It's a Neovim setup where **I know what everything does and why it's there.**

