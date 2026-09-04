# Neovim Configuration

A minimal, lazy.nvim-powered Neovim setup using the Catppuccin (Mocha) theme with a transparent
background, Telescope for fuzzy finding, and nvim-tree as the file explorer.

## Directory Structure

```
~/.config/nvim/
├── init.lua                      # Entry point
├── lazy-lock.json                # lazy.nvim lock file (pinned plugin commits)
├── lua/
│   └── keivan/                   # Personal module namespace
│       ├── init.lua              # Loads remaps, lazy.nvim, and Catppuccin setup
│       ├── lazy.lua              # lazy.nvim bootstrap + netrw disable + plugin specs
│       ├── remap.lua             # Leader keymaps (file explorer, tabs)
│       └── plugins/              # Plugin specs imported by lazy.nvim
│           ├── telescope.lua
│           ├── nvim-tree.lua     # File explorer plugin spec
│           ├── lualine.lua       # Statusline plugin spec
│           └── treesitter.lua
└── after/
    └── plugin/                   # Sourced after all plugins are loaded
        ├── colors.lua            # Applies catppuccin-mocha + transparent background
        ├── telescope.lua         # Telescope keymaps
        └── treesitter.lua        # Installs parsers (javascript, php, c)
```

## Startup Flow

1. **`init.lua`** — requires the `keivan` module, calls `require("lualine").setup()`
   (statusline with defaults), and enables line numbers on the current window.
2. **`lua/keivan/init.lua`** — first sets `mapleader` to `<Space>` and `maplocalleader` to `\`
   (this must happen **before** `keivan.remap` — `<leader>` resolves at `vim.keymap.set()` time,
   otherwise every mapping silently binds to the default `\` leader), then requires, in order:
   - `keivan.remap` (leader mappings),
   - `keivan.lazy` (bootstraps lazy.nvim if missing, disables netrw, then runs `lazy.setup()`),
   - `require("catppuccin").setup()` with Telescope integration enabled (`nvchad` style).
3. **`after/plugin/*.lua`** — sourced automatically by Neovim after all plugins load:
   colorscheme is applied here (not in the spec), keymaps and per-plugin setup run.

## Plugins (lazy.nvim)

| Plugin | File | Purpose | Notes |
|---|---|---|---|
| `catppuccin/nvim` | `lua/keivan/lazy.lua` | Colorscheme | `priority = 1000`, Telescope integration via `keivan/init.lua` |
| `nvim-telescope/telescope.nvim` | `plugins/telescope.lua` | Fuzzy finder | Pinned to `version = "*"`, uses `telescope-fzf-native.nvim` (built with `make`) + `plenary.nvim` |
| `nvim-neo-tree/neo-tree.nvim` | `plugins/nvim-tree.lua` | File explorer | `lazy = false`, `branch = "v3.x"`; depends on plenary, nui.nvim, nvim-web-devicons |
| `nvim-lualine/lualine.nvim` | `plugins/lualine.lua` | Statusline | Setup with defaults in root `init.lua` |
| `nvim-treesitter/nvim-treesitter` | `plugins/treesitter.lua` | Better syntax/highlighting | `build = ":TSUpdate"`; parsers installed in `after/plugin/treesitter.lua` |
| `tpope/vim-commentary` | `lua/keivan/lazy.lua` | Comment toggling (`gcc`) | |
| `tpope/vim-surround` | `lua/keivan/lazy.lua` | Add/change/delete surrounding pairs | |
| `tpope/vim-eunuch` | `lua/keivan/lazy.lua` | Shell-style commands (`:Rename`, `:Delete`, `:SudoWrite`, …) | |

`lazy-lock.json` pins every plugin to an exact commit for reproducibility.

## Keymaps

Leader is **Space**; local leader is **\**.

### File explorer (`lua/keivan/remap.lua`)

| Key | Action |
|---|---|
| `<leader>e` | Toggle neo-tree (`:Neotree toggle`) |
| `<leader>ev` | `:Neotree reveal` — open tree and reveal current file (replaces the old `:Ex`, which is unavailable because netrw is disabled) |

### Tabs (`lua/keivan/remap.lua`)

| Key | Action |
|---|---|
| `<leader>ct` | Create new tab (`:tabnew`) |
| `<leader>nt` | Next tab (`:tabnext`) |
| `<leader>pt` | Previous tab (`:tabprevious`) |

### Telescope (`after/plugin/telescope.lua`)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fa` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fg` | Git files |
| `<leader>ps` | Grep for input string (`grep_string` with prompt) |

## Theme & UI

- `after/plugin/colors.lua` applies **catppuccin-mocha** and makes `Normal` /
  `NormalFloat` backgrounds transparent (blends with terminal background).
- `termguicolors` is enabled in `after/plugin/nvimtree.lua`.
- Line numbers enabled in `init.lua` (see quirks below).

## Quirks & Notes

- `termguicolors` is enabled in `lua/keivan/lazy.lua`.
- Line numbers enabled globally in `init.lua` via `vim.opt.number`.
- Treesitter uses the new `main`-branch API (`require('nvim-treesitter').install {...}`)
  instead of `:TSInstall`. It **requires the `tree-sitter` CLI** on `$PATH`
  (`brew install tree-sitter-cli`) — there is no `cc` fallback.

---

## Migrating nvim-tree.lua → neo-tree.nvim

There are **three files** with passages that must change. `lazy-lock.json` updates itself
on the next `:Lazy sync` — do not edit it by hand.

### 1. `lua/keivan/plugins/nvim-tree.lua` (plugin spec — full replacement)

Replace the nvim-tree spec with the neo-tree spec (renaming the file to `neo-tree.lua` is
optional but tidy):

```lua
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not installed by default
        "MunifTanjim/nui.nvim",        -- required
    },
    config = function()
        require("neo-tree").setup {}
    end,
}
```

Key differences: the repo is `nvim-neo-tree/neo-tree.nvim`, you must pin `branch = "v3.x"`,
and it needs **plenary.nvim** and **nui.nvim** as dependencies (keep `nvim-web-devicons` —
lualine uses it too).

### 2. `lua/keivan/remap.lua` (toggle mapping)

```lua
-- Before
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- After
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
```

`:NvimTreeToggle` does not exist in neo-tree; the equivalent command is
`:Neotree toggle` (toggles the last-used source, defaulting to the filesystem window on
the left). An explicit form is `:Neotree toggle filesystem left`.

Optionally also fix the broken `<leader>pv` mapping, since netrw stays disabled:

```lua
vim.keymap.set("n", "<leader>pv", ":Neotree reveal<CR>", { silent = true })
```

(`:Neotree reveal` opens the tree and reveals the current file — a good `:Ex` replacement.
`:Neotree current` mirrors netrw's directory listing of the cwd instead.)

### 3. netrw disabling: move it to `lua/keivan/lazy.lua` — and DELETE `after/plugin/nvimtree.lua`

The old `after/plugin/nvimtree.lua` (netrw disable + extra `setup()`) must be **deleted**, not converted:

- `require("neo-tree").setup()` with **no argument crashes** this neo-tree version
  (`attempt to index upvalue 'new_user_config'`), unlike nvim-tree which accepted
  a nil config. The plugin spec's `setup {}` is the only setup call you need.
- The `vim.g.loaded_netrw` flags are **ineffective in `after/plugin`**: lazy.nvim
  sources `$VIMRUNTIME/plugin/netrwPlugin.vim` *during* `require("lazy").setup()`
  (its `startup()` packadds the original runtimepath), which happens **before** your
  `after/plugin` files run. netrwPlugin loads with the flags unset, registers its
  `VimEnter` autocmds, and then the late flags block its autoload functions →
  `E117: Unknown function: netrw#LocalBrowseCheck`.

Correct placement — in `lua/keivan/lazy.lua`, before `require("lazy").setup(...)`:

```lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
```

This was the verified working state after debugging: with the flags set before
`lazy.setup()`, netrwPlugin never loads (its guard `if &cp || exists("g:loaded_netrw")
|| exists("g:loaded_netrwPlugin")` exits early), so `nvim somedir/` directory buffers
are handled by neo-tree's own netrw hijack instead.

### 4. `lazy-lock.json` — no manual changes

Run `:Lazy sync` (or just restart Neovim) after editing the spec; the `nvim-tree.lua` entry
is replaced by `neo-tree.nvim` automatically.

### 5. Environment requirement for treesitter (unrelated to neo-tree)

The nvim-treesitter `main` branch compiles parsers with `tree-sitter build -o parser.so`,
so the CLI must be installed: `brew install tree-sitter-cli` (note: the `tree-sitter`
brew formula is only the library, **not** the CLI). Without it you get
`ENOENT ... 'tree-sitter'` errors from `after/plugin/treesitter.lua`.

### Useful neo-tree defaults to know

| Key / command | Action |
|---|---|
| `<cr>` / `o` | Open file |
| `s` | Open file in vertical split |
| `S` | Open file in horizontal split |
| `t` | Open file in new tab |
| `\` (your `maplocalleader`) | Toggle neo-tree focus/open |
| `H` | Toggle hidden files |
| `<space>` | Show available commands (command palette) |
| `:Neotree reveal` | Open tree and reveal current file |
