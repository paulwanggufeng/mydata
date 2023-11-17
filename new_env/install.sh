#!/usr/bin/bash

source scripts/functions.sh

# install data
TARGET_INSTALL_CLANG_VER=16

NODEJS_DOWNLOAD_URL=$(get_download_url "node")
NVIM_URL=$(get_download_url "nvim")
CLION_DOWNLOAD_URL=$(get_download_url "clion")
PYCHARM_DOWNLOAD_URL=$(get_download_url "pycharm")


function init(){
    # store install status in .done dir
    mkdir -p .done
    # download data to .temp dir
    mkdir -p .temp
    # default install dir is "${HOME}/mytools"
    default_install_dir="${HOME}/mytools"

    mkdir -p ${HOME}/mytools/mycommands

    DOWNLOAD_URL_FILE="./data/download_url.txt"
}
init

# wget ${CLION_DOWNLOAD_URL}
# exit 0

### manual install
# change default language
# install chrome, vpn(anyconnect)


# install fonts (NerdFonts/Hack)
# copy all of files or dirs to ~/.local/share/fonts if the targets not exist (check files first)
if [ ! -f ".done/font-installed" ]; then
    if [ ! -d "~/.local/share/fonts" ]; then
        mkdir -p ~/.local/share/fonts
    fi
    cp -r ./fonts/* ~/.local/share/fonts
    touch .done/font-installed
fi

# change /etc/apt/sources.list
# use diff to check if the sources.list is different, copy file if the file is not the same
if [ ! -f ".done/apt-sources-list" ]; then
    diff ./apt/sources.list /etc/apt/sources.list > /dev/null
    if [ $? -ne 0 ]; then
        echo "sources.list is different, copy file"
        sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
        sudo cp ./apt/sources.list /etc/apt/sources.list
        sudo apt update
        sudo apt upgrade
    fi
    touch .done/apt-sources-list
else
  echo "apt sources.list is already done"
fi

# normal install
if [ ! -f ".done/normal-apt-installed" ]; then
    # install app
    sudo apt install -y xsel
    sudo apt install -y htop ripgrep fzf tree
    sudo apt install -y python3 flake8 python3-pip python3-venv python3-dev
    sudo apt install -y build-essential cmake ncurses-dev libncurses5-dev libpcre2-dev gettext
    sudo apt install -y cargo
    sudo apt install -y shellcheck
    sudo apt install -y rdesktop    # for remote desktop

    # neovim related
    sudo pip3 install neovim

    # install tools and link to ~/.local/bin
    sudo apt install -y bat fd-find
    pushd ~/.local/bin/
    ln -sf /usr/bin/batcat bat
    ln -sf /usr/bin/fdfind fd
    popd
    touch .done/normal-apt-installed
else
  echo "apt normal install is already done"
fi

# install fish and set config, autocomplete etc.

# install cmake, clang, gcc, git
# install_cmake ${TARGET_INSTALL_CMAKE_VER}
install_clang ${TARGET_INSTALL_CLANG_VER}

### neovim related
# install nodjs for github.copilot
install_nodejs ${NODEJS_DOWNLOAD_URL} "${HOME}/mytools"

# install nvim and set config
install_nvim ${NVIM_URL}

# install gdb 
# copy .gdbinit
if [ ! -f .done/gdbinit_installed ]; then
    cat ../home/dbinit_stl_views-1.03.txt >> ~/.gdbinit
    touch .done/gdbinit_installed
fi

# install clion, pycharm, vscode, wps, youdao-note
# copy desktop icon to the ~/.local/share/applications/*.desktop


