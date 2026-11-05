# Mi configuración personal de Vim

Configuración minimalista pero potente de **Vim clásico**.

Esta primera versión está basada en la guía de configuración de vimrc de  **freeCodeCamp**:
[vimrc configuration guide - freeCodeCamp](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)

## Requisitos previos
- Vim >= 8.2 (recomendado)
- curl instalado
- Node.js
- npm (incluido con Node.js)
- Git

## Estructura de directorios que vamos a crear
```tree
.vim/
 ├── autoload/    # vim-plug y plugins que se cargan bajo demanda
 ├── backup/      # copias de seguridad de ficheros
 ├── colors/      # esquemas de colores
 └── plugged/     # plugins instalados por vim-plug
```

Creamos la estructura:

```bash
# --parents crea directorios padres si no existen
mkdir --parents ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
```

## Plugins para vim
Para añadir plugin: yo voy a usar el gestor de plugins vim-plug [Instalar vim-plug (curl)](https://github.com/junegunn/vim-plug#installation), lo instalamos con el siguiente comando.

```bash
# -f: fallar silenciosamente
# -L: seguir redirecciones
# -o: guardar en archivo
# --create-dirs: crear directorios necesarios

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Node.js y npm

coc-nvim necesita Node.js y npm. Instálalos con pacman:

```bash
# Instalar Node.js y npm con pacman (Arch Linux)
sudo pacman --sync nodejs npm

# Configurar directorio global para paquetes npm (evitar sudo)
mkdir ~/.npm-global
npm config set prefix ~/.npm-global

# Agregar al PATH en ~/.bashrc
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Verifica que las versiones sean correctas:

```bash
# Verificar la versión de node
node --version

# Verificar la versión de npm
npm --version
```

## Instalación

Vincula el fichero de configuración del repositorio con tu `~/`.

```bash
# Eliminar ~/.vimrc si ya existe
rm -r ~/.vimrc

# Crear enlace simbólico de vimrc.vim a ~/.vimrc
ln -sf "$(pwd)/vimrc.vim" ~/.vimrc
```

## Actualización

```bash
# Actualizar repositorio
git pull
```

Los cambios se aplican automáticamente gracias al enlace simbólico.
