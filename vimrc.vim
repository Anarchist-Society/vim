""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ==========================================================================
" 1. CONFIGURACIÓN GENERAL
" ==========================================================================

" ==============================
" Detectar tipo de fichero y habilitar plugins
" ==============================

filetype on
filetype plugin on
filetype indent on

" ==============================
" Interfaz
" ==============================

syntax on " Activar resalto de sintaxis
set number " Mostrar número de líneas absoluto
set relativenumber " Mostrar número de líneas relativo
set scrolloff=10  " Mantener 10 líneas de margen vertical al desplazarse
set linebreak " Evita cortar palabras al hacer wrap
set termguicolors " Mejor soporte de colores
set background=dark " Mejora soporte de colores en fondos oscuros

" ==============================
" Tabs y espacios
" ==============================

set shiftwidth=4 " Indent automático de 4 espacios
set tabstop=4 " Tab representa 4 espacios
set expandtab " Convertir tabs a espacios

" ==============================
" Búsqueda
" ==============================

set incsearch " Búsqueda incremental
set hlsearch " Resaltar coincidencias
set ignorecase " Ignorar mayúsculas
set smartcase " Sensible a mayúsculas si se usan
set showmatch " Resaltar paréntesis coincidentes

" ==============================
" Backup y undo
" ==============================

set nowritebackup " No crear backup al guardar
set noswapfile " No crear swap
set history=10 " Historial de comandos

if version >= 703
    set undodir=~/.vim/backup " Directorio para fichero de undo
    set undofile " Guardar undo persistentemente
    set undoreload=10000 " Máx. deshacer/rehacer
endif

" ==============================
" Autoreload externo
" ==============================

set autoread " Aplicar cambios si se edita de forma externa

" ==============================
" Wildmenu (autocompletado)
" ==============================

set wildmode=list:longest,full
set wildignore=*.out,*.class,*.pdf

" ==========================================================================
" 2. PLUGINS (vim-plug)
" ==========================================================================

call plug#begin('~/.vim/plugged')

" ==============================
" Herramientas
" ==============================

" Linter en tiempo real
Plug 'dense-analysis/ale'
" Autocompletado + LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Explorador de ficheros
Plug 'preservim/nerdtree'
" Pantalla de inicio
Plug 'mhinz/vim-startify'
" Muestra iconos de git en ficheros
Plug 'airblade/vim-gitgutter'
" Muestra iconos de git en NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Indent lines
" Plug 'Yggdroot/indentLine'

" ==============================
" Web development
" ==============================

" Habilitar Live-Server
Plug 'https://github.com/wolandark/vim-live-server.git', { 'do': 'sudo npm install -g live-server' }
" Plug 'mattn/emmet-vim' " Expansión de abreviaciones HTML/CSS (Emmet) -> Lo he comentado porque con coc-emmet ya cumple su función
" Plug 'alvan/vim-closetag' " Cierra automáticamente etiquetas HTML/XML -> Lo he comentado porque coc-html ya cumple con su función
" Plug 'AndrewRadev/tagalong.vim' " Actualiza etiquetas de cierre al renombrar la apertura (Conflicto con emmet) arreglar
" Plug 'ap/vim-css-color' " Solucionar error con hsl y hsla

" ==============================
" Apariencia
" ==============================

Plug 'ghifarit53/tokyonight-vim' " Colorscheme
" Plug 'gerardbm/vim-atomic' " Colorscheme
" Plug 'gerardbm/vim-cosmic' " Colorscheme
" Plug 'altercation/vim-colors-solarized' " Colorscheme
" Plug 'lifepillar/vim-solarized8' " Colorscheme
" Plug 'kyoz/purify', { 'rtp': 'vim' } "Colorscheme

" Habilita colores en NERDTree e iconos de vim-devicons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Añade iconos para Vim (Obligatorio ir al final)
Plug 'ryanoasis/vim-devicons'
call plug#end()

" ==========================================================================
" 3. CONFIGURACIÓN DE PLUGINS
" ==========================================================================

" ==============================
" Colorscheme
" ==============================

colorscheme tokyonight

" ==============================
" NERDTree
" ==============================

let g:NERDTreeWinPos = 'right' " Abrir NERDTree a la derecha

" Auto-cerrar Vim si NERDTree es la única ventana que queda en la única pestaña
autocmd BufEnter *
            \ if tabpagenr('$') == 1 && winnr('$') == 1
            \    && exists('b:NERDTree') && b:NERDTree.isTabTree()
            \ |  call feedkeys(":quit\<CR>:\<BS>")
            \ | endif

" Auto-cerrar Vim si NERDTree es la única ventana
autocmd BufEnter *
            \ if winnr('$') == 1 && exists('b:NERDTree')
            \ && b:NERDTree.isTabTree()
            \ | call feedkeys(":quit\<CR>:\<BS>")
            \ | endif

let NERDTreeRespectWildIgnore=1 " Ocultar en NERDTree los ficheros definidos en 'wildignore'

" ==============================
" vim-startify
" ==============================

" Abrir Startify + NERDTree
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Bookmarks
let g:startify_bookmarks = [{'c': '~/.vimrc'}]

" ==============================
" vim-nerdtree-syntax-highlight
" ==============================

" Configuración de colores - NERDTree + WebDevIcons

" Desactiva el color por defecto para el ícono de directorios o carpetas
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1

" Desactiva el color por defecto para el ícono de ficheros o archivos
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" Cuando coincida por extensión (.js, .py, .html, etc)
let g:NERDTreeFileExtensionHighlightFullName = 1

" Aplica el resaltado al nombre completo
" Cuando hay una coincidencia exacta (Makefile, Dockerfile, etc)
let g:NERDTreeExactMatchHighlightFullName = 1

" Aplica el resaltado al nombre completo
" Cuando coincide con un patrón definido (*.config.js, *.test.ts, etc)
let g:NERDTreePatternMatchHighlightFullName = 1

" ==============================
" Emmet
" ==============================

" let g:user_emmet_leader_key = ','

" let g:indentLine_enabled = 0

" ==========================================================================
" 4. MAPPINGS
" ==========================================================================

" Dvorak - Remapeo de navegación (hjkl → rtns)
" nnoremap r h " ← izquierda
" nnoremap t j " ↓ abajo
" nnoremap n k " ↑ arriba
" nnoremap s l " → derecha

" Leader key
let mapleader = ","
nnoremap <LEADER>w :w<ENTER>
nnoremap <LEADER>q :q<ENTER>
nnoremap <LEADER>n :NERDTreeToggle<CR>
nnoremap <LEADER>f :NERDTreeFind<CR>
" nmap <silent> <leader>ca <Plug>(coc-codeaction-line)
" nnoremap <LEADER>t :terminal<CR>
" nnoremap <LEADER>tr :terminal ./mvnw spring-boot:run<CR>

" Insert mode
" inoremap jj <ESC>

" Normal mode
nnoremap <SPACE> :
nnoremap o o<ESC>
nnoremap O O<ESC>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <C-UP> <C-w>+
nnoremap <C-DOWN> <C-w>-
nnoremap <C-LEFT> <C-w>>
nnoremap <C-RIGHT> <C-w><

" ==========================================================================
" 5. VIMSCRIPT
" ==========================================================================

" Para tabular con 2 espacios ficheros html, css, javascript, json
" autocmd FileType html,css,javascript,json setlocal shiftwidth=2 tabstop=2 expandtab

" Para tabular con 2 espacios ficheros sql
" autocmd FileType sql setlocal shiftwidth=2 tabstop=2 expandtab

" Prettier al guardar en ficheros web (receta oficial de coc.nvim)
augroup coc_fmt
    autocmd!
    autocmd BufWritePre *.html,*.css,*.js,*.json call CocAction('format')
augroup END

" Solución para indentar html + css
" let g:html_indent_style1 = "inc"

" Solución para indentar python
" autocmd FileType python setlocal nosmartindent

" Configuración extra del indentador de Python (Vim 8.2+ / Neovim)
" let g:python_indent = {}
" let g:python_indent.disable_parentheses_indenting = 1
" let g:python_indent.closed_paren_align_last_line = 0

" let g:indentLine_enabled = 0 " Desactivado por defecto
" let g:indentLine_fileType = ['html'] " Solo activo en HTML

" ==========================================================================
" 6. STATUS LINE
" ==========================================================================

set statusline= " Reseteamos el statusline

" / -> Espacio literal
set statusline+=%f " %F -> Ruta completa del fichero, he cambiado %F -> %f para ver solo el nombre del fichero y no la ruta completa
set statusline+=\ %M " %M -> Muestra + si el fichero está modificado
set statusline+=\ %Y " %Y -> Tipo de fichero
set statusline+=\ %R " %R -> Muestra RO si el fichero está en modo lectura

set statusline+=%= " Divide el statusline en dos partes, todo lo que esté antes a la izquierda, lo que esté después a la derecha

set statusline+=ascii:\ %b " %b -> Valor ASCII del carácter bajo el cursor
set statusline+=\ hex:\ 0x%B " 0x%B -> Valor ASCII en hexadecimal
set statusline+=\ row:\ %l " %l -> Número de línea actual
set statusline+=\ col:\ %c " %c -> Número de columna actual
set statusline+=\ percent:\ %p%% " %p -> Porcentaje dentro del fichero, %% -> imprime un % literal
set laststatus=2 " Controla cuando se muestra el statusline, 0 nunca, 1 solo si hay una ventana, 2 siempre visible
set statusline+=\ time:\ %{strftime('%H:%M')}
