# CHANGELOG

## [2.5.1] - 2026-09-30
### Removed
- `g:tokyonight_enable_italic = 1`: se retira la cursiva en keywords porque la fuente
  en uso no incluye variante itálica y las keywords se dibujaban con una inclinada
  sintética poco legible. No hace falta fijarla: el plugin la lee con
  `get(g:, 'tokyonight_enable_italic', 0)`, ya desactivada por defecto

## [2.5.0] - 2026-09-30
### Added
- `mattn/emmet-vim` plugin, enabled only on the `html` and `css` filetypes via
  `g:user_emmet_install_global = 0` and `autocmd FileType html,css EmmetInstall`
- Default `<C-y>,` trigger kept, without overriding `g:user_emmet_leader_key`
- `g:tokyonight_style = 'night'`, set before `colorscheme tokyonight` as the plugin
  requires. `g:tokyonight_enable_italic = 1` was also added here, later removed in [2.5.1]
- Blank lines between consecutive `Plug` declarations in the tools section
### Notes
- `coc-emmet` was evaluated and rejected. It only provides completion (the author
  points to emmet-vim for expansion), it has not been published since 2020, and it
  cannot be installed here: npm 12 ships `allow-git = "none"`, while
  `coc-emmet@1.1.6` pins a devDependency to a GitHub branch
  (`@emmetio/css-parser@github:ramya-rao-a/css-parser#vscode`), so the install
  aborts with `EALLOWGIT`. coc.nvim does not enforce `engines.coc`, that mismatch
  was not the blocker.

## [2.4.0] - 2026-09-28
### Removed
- Commented-out `Yggdroot/indentLine` plugin declaration and its section header
- Commented-out `mattn/emmet-vim` (unverified claim that coc-emmet replaced it: coc-emmet
  only offers completion and was never actually installed here; emmet-vim has since been
  re-enabled in [2.5.0])
- Commented-out `alvan/vim-closetag` (already covered by the coc-html extension)
- Commented-out `AndrewRadev/tagalong.vim` (unresolved conflict with emmet)
- Commented-out `ap/vim-css-color` plugin declaration
- Commented-out alternative colorschemes: `gerardbm/vim-atomic`, `gerardbm/vim-cosmic`,
  `altercation/vim-colors-solarized`, `lifepillar/vim-solarized8` and `kyoz/purify`

## [2.3.0] - 2026-09-08
### Changed
- Reorganized section headers, spacing and comment structure throughout vimrc.vim
- Normalized separator widths: sub-sections now use a consistent width, main sections another
- Moved plugin descriptions from inline comments to their own lines
- Restored `sudo npm install -g live-server` install hook for vim-live-server
- Activated `relativenumber` (hybrid line numbers)
- Added clock to statusline (`%{strftime('%H:%M')}`)
- Reactivated filetype autocmd for 2-space indentation in html, css, javascript, json
- Removed `g:startify_change_to_dir = 0` to restore default behavior: the prompt follows the directory of the file opened from startify
- Replaced tab indentation with spaces in the persistent undo block
### Disabled
- `vim-atomic`, `vim-cosmic`, `vim-solarized8`, `purify` colorschemes (commented out, tokyonight kept)
- `<LEADER>t` terminal mapping
- `<leader>ca` coc code action mapping
### Removed
- `BufWritePre` autocmds for prettier formatting (`prettier.forceFormatDocument`, `prettier.formatFile`)

## [2.2.0] - 2026-09-08
### Changed
- Enabled coc-nvim plugin for autocompletion + LSP support
- Disabled indentLine plugin
- Disabled filetype-specific autocmd indentation for html, css, javascript, json, sql, python
- Disabled BufWritePre prettier auto-formatting
- Disabled html_indent_style1 setting
- Disabled python indent configuration
- Disabled indentLine_fileType restriction

## [2.1.0] - 2026-08-01
### Added
- Dvorak keyboard support: added commented mappings (r/t/n/s → hjkl) for future activation
### Changed
- Enabled absolute line numbers (`set number`)
- Switched default colorscheme to `tokyonight`
- indentLine now only enabled for HTML files (`g:indentLine_fileType = ['html']`)
### Disabled
- coc-nvim plugin (commented out)
- `inoremap jj <ESC>` mapping (commented out)
- `emmet-vim` leader key config (commented out)

## [2.0.6] - 2026-02-15
### Changed
- Improved internal documentation in vimrc.vim: added clear Spanish comments explaining
  - `NERDTreeRespectWildIgnore` behavior
  - WebDevIcons default icon color disabling for folders and files
  - Full filename highlighting in NERDTree (by extension, exact match and patterns)

## [2.0.5] - 2026-02-14
### Added
- Filetype-specific indentation for JSON: `shiftwidth=2`, `tabstop=2`, `expandtab`
- Improved HTML indentation: `let g:html_indent_style1 = "inc"` to add one extra indent level for CSS inside `<style>` tags

## [2.0.4] - 2026-02-14
### Changed
- Switched default colorscheme to `atomic` for improved minimalism and better color consistency
### Added
- `let g:NERDTreeRespectWildIgnore = 1`: Makes NERDTree honor Vim's `wildignore` settings to hide build/output files consistently

## [2.0.3] - 2026-02-14
### Changed
- Remove line numbers (commented `set number` and `set relativenumber` for cleaner, more minimalistic interface)
- Update persistent undo
- Expanded `wildignore` to include `*.out`, `*.class`, `*.pdf`
### Added
- `AndrewRadev/tagalong.vim`: Sync opening and closing HTML/XML tags on rename (great for HTML/CSS editing)
- `wolandark/vim-live-server` (unused live reload plugin)
- `mattn/emmet-vim` (Emmet abbreviation expansion under testing/minimal config)

## [2.0.2] - 2025-12-03
### Added
- Enable hybrid line numbers ('number' + 'relativenumber')
- Add `~/.vimrc` bookmark in vim-startify
- Disable NERDTree line count to prevent breaking `tiagofumo/vim-nerdtree-syntax-highlight`

## [2.0.1] - 2025-11-30
### Added
- Auto-close Vim when only NERDTree remains in the only tab
- Auto-close current tab when NERDTree is the only window left in it
- Show file line counts in NERDTree (`NERDTreeFileLines = 1`)

## [2.0.0] - 2025-11-29
### Added
- Automatic vim-startify + NERDTree on startup when opening Vim without arguments
- `<LEADER>n` -> Toggle NERDTree
- `<LEADER>f` -> Reveal current file NERDTreeToggle (replaced by `<LEADER>n`)
- Update MAPPINGS section with new keybindings documentation

## [1.9.0] - 2025-11-27
### Added
- `tiagofumo/vim-nerdtree-syntax-highlight` → syntax highlighting in NERDTree
- `ryanoasis/vim-devicons` → file icons in NERDTree
- Leader key set to comma: `let mapleader = ","`
- Quick save shortcut: `,w` → `:w<ENTER>`

## [1.8.0] - 2025-11-26
### Added
- Add custom statusline  
- Replaced the default statusline with a clean, informative one that shows:  
- Full file path (%F)  
- Modified/Readonly flags (%M %R)  
- Filetype (%Y)  
- ASCII value (%b) and hex value (0x%B) of current character  
- Current row, column and percentage (%l,%c %p%%)

## [1.7.0] - 2025-11-26
### Added
- Disable vim-startify automatic directory change (`let g:startify_change_to_dir = 0`)

## [1.6.0] - 2025-11-20
### Added
- NERDTree now opens on the **right** side (`let g:NERDTreeWinPos = "right"`)
### Changed
- Switch default colorscheme to **CosmicLunarC5**
- Remove line numbers and relative numbers for a more minimal look
- Remove `wolandark/vim-live-server` (unnecessary browser-sync dependency)

## [1.5.0] - 2025-11-19
### Changed
- Complete refactor and reorganization of `.vimrc`
- Divided into 5 clearly commented sections for better readability and maintenance
- Grouped related settings and improved visual structure
- Moved plugin-specific mappings (NERDTree) to dedicated section
- Minor syntax optimizations (combined `set` commands where possible)

## [1.4.0] - 2025-11-19
### Added
- New plugin: 'gerardbm/vim-atomic'
- Set 'colorscheme atomic' as default theme (loads correctly after plugins)

## [1.3.1] - 2025-11-18
### Fixed
- Corrected NERDTree toggle keymap: changed `:ERDTreeToggle` → `:NERDTreeToggle`

## [1.3.0] - 2025-11-18
### Added
- Persistent undo:
- `undodir=~/.vim/backup`
- `undofile`
- `undoreload=10000`
- FileType-specific settings:
- HTML files: `shiftwidth=2`, `tabstop=2`, `expandtab`

## [1.2.0] - 2025-11-18
### Added
- Custom keymaps:
- Insert mode: `jj` → Esc
- Normal mode: `<SPACE>` → command mode, `o`/`O` → new line
- Window navigation: `<C-h/j/k/l>` → move between windows
- Window resizing: `<C-UP/DOWN/LEFT/RIGHT>`
- Plugin shortcuts: `<C-n>` → toggle NERDTree

## [1.1.0] - 2025-11-18
### Added
- Plugins:
- ALE (Asynchronous Lint Engine) for linting
- NERDTree for file navigation
- CoC.nvim (release branch) for autocompletion
- vim-startify for a startup screen
- vim-live-server for live reload development

## [1.0.0] - 2025-11-18
### Added
- Basic Vim settings (filetype, autoread)
- Visual enhancements (syntax highlighting, dark background, line numbers, relative numbers, scroll offset)
- Tab and indentation settings (shiftwidth, tabstop, expandtab)
- Backup settings disabled (noswapfile, nowritebackup)
- Search enhancements (incsearch, ignorecase, smartcase, showmatch, hlsearch)
- Command history configured (history=1000)
- Command-line completion enhancements (wildmenu, wildmode=list:longest,full)
- Ignored file types for completion (`*.docx, *.jpg, *.png, *.gif, *.pdf, *.pyc, *.exe, *.flv, *.img, *.xlsx, *.o`)
