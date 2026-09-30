# CHANGELOG

## [2.5.1] - 2026-09-30
### Eliminado
- `g:tokyonight_enable_italic = 1`: se retira la cursiva en keywords porque la fuente
  en uso no incluye variante itálica y las keywords se dibujaban con una inclinada
  sintética poco legible. No hace falta fijarla: el plugin la lee con
  `get(g:, 'tokyonight_enable_italic', 0)`, ya desactivada por defecto

## [2.5.0] - 2026-09-30
### Añadido
- Plugin `mattn/emmet-vim`, activo solo en los filetype `html` y `css` mediante
  `g:user_emmet_install_global = 0` y `autocmd FileType html,css EmmetInstall`
- Se mantiene el trigger por defecto `<C-y>,` sin sobrescribir
  `g:user_emmet_leader_key`
- `g:tokyonight_style = 'night'`, definido antes de `colorscheme tokyonight` como
  exige el plugin. `g:tokyonight_enable_italic = 1` también se añadió aquí y se
  retiró después en [2.5.1]
- Líneas en blanco entre declaraciones `Plug` consecutivas en la sección de
  herramientas
### Notas
- `coc-emmet` se evaluó y se descartó: solo ofrece completado (su autor apunta a
  `emmet-vim` para la expansión), no se publica desde 2020 y no se puede instalar
  aquí, porque npm 12 incluye `allow-git = "none"` mientras que
  `coc-emmet@1.1.6` fija una devDependency a una rama de GitHub
  (`@emmetio/css-parser@github:ramya-rao-a/css-parser#vscode`), de modo que la
  instalación aborta con `EALLOWGIT`. coc.nvim no aplica `engines.coc`, ese
  desajuste no fue el motivo.

## [2.4.0] - 2026-09-28
### Eliminado
- Declaración comentada del plugin `Yggdroot/indentLine` y su encabezado de sección
- `mattn/emmet-vim` comentado (afirmación sin verificar de que coc-emmet lo
  sustituyó: coc-emmet solo ofrece completado y nunca estuvo realmente instalado
  aquí; emmet-vim se ha reactivado desde [2.5.0])
- `alvan/vim-closetag` comentado (ya cubierto por la extensión coc-html)
- `AndrewRadev/tagalong.vim` comentado (conflicto sin resolver con emmet)
- Declaración comentada del plugin `ap/vim-css-color`
- Colorschemes alternativos comentados: `gerardbm/vim-atomic`,
  `gerardbm/vim-cosmic`, `altercation/vim-colors-solarized`,
  `lifepillar/vim-solarized8` y `kyoz/purify`

## [2.3.0] - 2026-09-08
### Cambiado
- Se reorganizaron los encabezados de sección, los espacios y la estructura de
  comentarios de todo vimrc.vim
- Se normalizaron los anchos de los separadores: las subsecciones usan ahora un
  ancho constante y las secciones principales otro
- Las descripciones de los plugins pasaron de comentarios en línea a líneas propias
- Se restauró el hook de instalación `sudo npm install -g live-server` de
  vim-live-server
- Se activó `relativenumber` (números de línea híbridos)
- Se añadió el reloj al statusline (`%{strftime('%H:%M')}`)
- Se reactivó el autocmd de filetype para la indentación de 2 espacios en html,
  css, javascript y json
- Se eliminó `g:startify_change_to_dir = 0` para recuperar el comportamiento por
  defecto: el prompt sigue el directorio del fichero abierto desde startify
- Se sustituyó la indentación con tabuladores por espacios en el bloque de undo
  persistente
### Deshabilitado
- Colorschemes `vim-atomic`, `vim-cosmic`, `vim-solarized8` y `purify`
  (comentados, se mantiene tokyonight)
- Mapeo de terminal `<LEADER>t`
- Mapeo de coc code action `<leader>ca`
### Eliminado
- Autocmds `BufWritePre` de formateo con prettier (`prettier.forceFormatDocument`,
  `prettier.formatFile`)

## [2.2.0] - 2026-09-08
### Cambiado
- Se habilitó el plugin coc-nvim para autocompletado y soporte LSP
- Se deshabilitó el plugin indentLine
- Se deshabilitó la indentación por autocmd según filetype para html, css,
  javascript, json, sql y python
- Se deshabilitó el formateo automático con prettier en BufWritePre
- Se deshabilitó el ajuste html_indent_style1
- Se deshabilitó la configuración de indentación de python
- Se deshabilitó la restricción indentLine_fileType

## [2.1.0] - 2026-08-01
### Añadido
- Soporte del teclado Dvorak: se añadieron los mapeos comentados (r/t/n/s → hjkl)
  para activarlos más adelante
### Cambiado
- Se habilitaron los números de línea absolutos (`set number`)
- El colorscheme por defecto pasa a ser `tokyonight`
- indentLine ahora solo se habilita en ficheros HTML
  (`g:indentLine_fileType = ['html']`)
### Deshabilitado
- Plugin coc-nvim (comentado)
- Mapeo `inoremap jj <ESC>` (comentado)
- Configuración de la tecla líder de emmet-vim (comentada)

## [2.0.6] - 2026-02-15
### Cambiado
- Se mejoró la documentación interna de vimrc.vim: se añadieron comentarios en
  español que aclaran
  - El comportamiento de `NERDTreeRespectWildIgnore`
  - La desactivación del color de icono por defecto de WebDevIcons en carpetas
    y ficheros
  - El resaltado del nombre completo en NERDTree (por extensión, coincidencia
    exacta y patrones)

## [2.0.5] - 2026-02-14
### Añadido
- Indentación específica por filetype para JSON: `shiftwidth=2`, `tabstop=2`,
  `expandtab`
- Mejora de la indentación de HTML: `let g:html_indent_style1 = "inc"` añade un
  nivel de indentación extra para el CSS dentro de las etiquetas `<style>`

## [2.0.4] - 2026-02-14
### Cambiado
- El colorscheme por defecto pasa a ser `atomic`, por un minimalismo mayor y una
  coherencia de color más consistente
### Añadido
- `let g:NERDTreeRespectWildIgnore = 1`: hace que NERDTree respete los ajustes de
  `wildignore` de Vim para ocultar de forma consistente los ficheros de compilación
  y de salida

## [2.0.3] - 2026-02-14
### Cambiado
- Se eliminan los números de línea (`set number` y `set relativenumber`
  comentados para una interfaz más limpia y minimalista)
- Se actualiza el undo persistente
- Se amplía `wildignore` para incluir `*.out`, `*.class` y `*.pdf`
### Añadido
- `AndrewRadev/tagalong.vim`: sincroniza las etiquetas de apertura y cierre de
  HTML/XML al renombrar (muy útil al editar HTML/CSS)
- `wolandark/vim-live-server` (plugin de recarga en vivo sin usar)
- `mattn/emmet-vim` (expansión de abreviaturas Emmet en pruebas, con
  configuración mínima)

## [2.0.2] - 2025-12-03
### Añadido
- Se habilitan los números de línea híbridos ('number' + 'relativenumber')
- Se añade el marcador `~/.vimrc` en vim-startify
- Se deshabilita el recuento de líneas de NERDTree para no romper
  `tiagofumo/vim-nerdtree-syntax-highlight`

## [2.0.1] - 2025-11-30
### Añadido
- Cierre automático de Vim cuando solo queda NERDTree en la única pestaña
- Cierre automático de la pestaña actual cuando NERDTree es la única ventana
  que queda en ella
- Se muestra el recuento de líneas en NERDTree (`NERDTreeFileLines = 1`)

## [2.0.0] - 2025-11-29
### Añadido
- vim-startify + NERDTree automáticos al abrir Vim sin argumentos
- `<LEADER>n` -> alternar NERDTree
- `<LEADER>f` -> mostrar el fichero actual con NERDTreeToggle (sustituido por
  `<LEADER>n`)
- Se actualiza la sección MAPPINGS con la documentación de los nuevos atajos de
  teclado

## [1.9.0] - 2025-11-27
### Añadido
- `tiagofumo/vim-nerdtree-syntax-highlight` → resaltado de sintaxis en NERDTree
- `ryanoasis/vim-devicons` → iconos de fichero en NERDTree
- Tecla líder fijada en la coma: `let mapleader = ","`
- Atajo de guardado rápido: `,w` → `:w<ENTER>`

## [1.8.0] - 2025-11-26
### Añadido
- Añadir statusline personalizado  
- Se sustituye el statusline por defecto por uno limpio e informativo que
  muestra:  
- Ruta completa del fichero (%F)  
- Indicadores de modificado y solo lectura (%M %R)  
- Filetype (%Y)  
- Valor ASCII (%b) y valor hexadecimal (0x%B) del carácter actual  
- Fila, columna y porcentaje actuales (%l,%c %p%%)

## [1.7.0] - 2025-11-26
### Añadido
- Se deshabilita el cambio automático de directorio de vim-startify
  (`let g:startify_change_to_dir = 0`)

## [1.6.0] - 2025-11-20
### Añadido
- NERDTree ahora se abre en el lado **derecho** (`let g:NERDTreeWinPos = "right"`)
### Cambiado
- El colorscheme por defecto pasa a ser **CosmicLunarC5**
- Se eliminan los números de línea y los relativos para un aspecto más
  minimalista
- Se elimina `wolandark/vim-live-server` (dependencia innecesaria de browser-sync)

## [1.5.0] - 2025-11-19
### Cambiado
- Refactorización y reorganización completas de `.vimrc`
- Se divide en 5 secciones bien comentadas para mejorar la legibilidad y el
  mantenimiento
- Se agrupan los ajustes relacionados y se mejora la estructura visual
- Los mapeos de los plugins (NERDTree) se mueven a una sección propia
- Pequeñas optimizaciones de sintaxis (comandos `set` combinados donde se puede)

## [1.4.0] - 2025-11-19
### Añadido
- Nuevo plugin: 'gerardbm/vim-atomic'
- Se define 'colorscheme atomic' como tema por defecto (se carga bien tras los
  plugins)

## [1.3.1] - 2025-11-18
### Corregido
- Se corrigió el mapeo de alternancia de NERDTree: `:ERDTreeToggle` →
  `:NERDTreeToggle`

## [1.3.0] - 2025-11-18
### Añadido
- Undo persistente:
- `undodir=~/.vim/backup`
- `undofile`
- `undoreload=10000`
- Ajustes por FileType:
- Ficheros HTML: `shiftwidth=2`, `tabstop=2`, `expandtab`

## [1.2.0] - 2025-11-18
### Añadido
- Mapeos de teclado propios:
- Modo inserción: `jj` → Esc
- Modo normal: `<SPACE>` → modo comando, `o`/`O` → nueva línea
- Navegación entre ventanas: `<C-h/j/k/l>` → moverse entre ventanas
- Redimensionado de ventanas: `<C-UP/DOWN/LEFT/RIGHT>`
- Atajos de plugins: `<C-n>` → alternar NERDTree

## [1.1.0] - 2025-11-18
### Añadido
- Plugins:
- ALE (Asynchronous Lint Engine) para el linting
- NERDTree para la navegación de ficheros
- CoC.nvim (rama release) para el autocompletado
- vim-startify como pantalla de inicio
- vim-live-server para el desarrollo con recarga en vivo

## [1.0.0] - 2025-11-18
### Añadido
- Ajustes básicos de Vim (filetype, autoread)
- Mejoras visuales (resaltado de sintaxis, fondo oscuro, números de línea,
  números relativos, scroll offset)
- Ajustes de tabulación e indentación (shiftwidth, tabstop, expandtab)
- Ajustes de copia de seguridad deshabilitados (noswapfile, nowritebackup)
- Mejoras en la búsqueda (incsearch, ignorecase, smartcase, showmatch, hlsearch)
- Historial de comandos configurado (history=1000)
- Mejoras en el completado de la línea de comandos (wildmenu,
  wildmode=list:longest,full)
- Filetypes ignorados en el completado (`*.docx, *.jpg, *.png, *.gif, *.pdf, *.pyc, *.exe, *.flv, *.img, *.xlsx, *.o`)