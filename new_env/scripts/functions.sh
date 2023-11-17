#!/usr/bin/bash

# get_target_install_dir target_install_dir
# if param is empty, return default_install_dir
function get_target_install_dir() {
    if [ -z "$1" ]; then
        echo "${default_install_dir}"
    else
        echo "$1"
    fi
}

# get_extrace_dir extract_log
function get_extrace_dir() {
    echo $(cat ${1} | head -1 | cut -d '/' -f1)
}

function check_if_app_installed() {
    app_name=$1
    if ! command -v ${app_name} &> /dev/null
    then
        return 1
    fi
    return 0
}

# compare version string and return if the current version is newer (or equal) version
# params: current version, target version
function is_new_version() {
    current_ver_str=$1
    target_ver_str=$2
    new_ver=$(echo -e "${target_ver_str}\n${current_ver_str}" | sort -r | head -1)
    if [ "${new_ver}" == "${current_ver_str}" ]; then
        return 0
    else
        return 1
    fi
}

# get_app_ver app_name
function get_app_ver() {
    app_name=$1
    case ${app_name} in
        "git")
            app_ver=$(git --version | cut -d ' ' -f3)
            ;;
        "clang")
            # Ubuntu clangd version 15.0.0-1ubuntu1.1
            app_ver=$(clang --version | grep version | cut -d ' ' -f4 | cut -d '-' -f1)
            ;;
        "node")
            # v14.18.2
            app_ver=$(node --version | cut -d 'v' -f2)
            ;;
        *)
            echo "unhandled app name '${app_name}' to get version"
            exit 1
            ;;
    esac
    echo ${app_ver}
}

# get_filename_from_url url
function get_filename_from_url() {
    url=$1
    # parse file name from url
    # "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
    echo $(echo ${url} | awk -F '/' '{print $NF}')
}

# get download url from download_url.txt
# key url
# nvim https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
function get_download_url() {
    key="$@"
    value=$(grep "${key}" ${DOWNLOAD_URL_FILE} | awk '{print $2}')
    [[ -z "${value}" ]] && echo "not found '${key}' url" || echo "${value}"
}

# install_nodejs nodejs_download_url install_target_dir
function install_nodejs() {
    nodejs_download_url=$1
    install_target_dir=$2
    app_name="node"
    file_name=$(get_filename_from_url "${nodejs_download_url}")

    if check_if_app_installed "${app_name}" ; then
        # get node version
        target_ver=$(echo ${file_name} | cut -d '-' -f2 | cut -d 'v' -f2)
        current_ver=$(get_app_ver "${app_name}")
        if is_new_version "${current_ver}" "${target_ver}"; then
            return 0
        fi
    fi

    pushd .temp
    if [ ! -f "${file_name}" ]; then
        echo "download file ${file_name}"
        wget ${nodejs_download_url}
    fi

    extract_log="nodejs_extract.log"
    tar -xvf ${file_name} | tee ${extract_log}
    # get extrace dir name
    extract_dir=$(cat ${extract_log} | head -1 | cut -d '/' -f1)
    rm -f ${extract_log}
    # install to /usr/local/bin, NOTE: install to ~/.local/bin will cause error
    pushd ${extract_dir}
    sudo rm -fr /usr/local/lib/node_modules/ # remove old version if exist
    sudo mv bin/* /usr/local/bin/
    sudo mv lib/node_modules/ /usr/local/lib/
    popd
    rm -fr ${extract_dir}
    popd

    sudo npm install -g neovim
}

# install cmake version_num
function install_cmake() {
    target_ver=$1
    app_name="cmake"

    if check_if_app_installed "${app_name}" ; then
        current_ver=$(get_app_ver "${app_name}")
        if is_new_version "${current_ver}" "${target_ver}"; then
            return 0
        fi
    fi
    echo "NOTE: we have not implement install the new cmake currently. because the default version is enough"
}

# install_clang version_num
function install_clang() {
    target_ver=$1
    app_name="clang"

    if check_if_app_installed "${app_name}" ; then
        current_ver=$(get_app_ver "${app_name}")
        if is_new_version "${current_ver}" "${target_ver}"; then
            return 0
        fi
    fi

    pushd .temp
    wget https://apt.llvm.org/llvm.sh
    chmod +x llvm.sh
    sudo ./llvm.sh ${target_ver}
    popd
}

# install_nvim nvim_url install_target_dir
function install_nvim() {
    if [ -f ".done/nvim-installed" ]; then
        echo "nvim already installed, skip"
        nvim -v
        return 0
    fi

    nvim_url=$1
    install_target_dir=$(get_target_install_dir "$2")
    file_name=$(get_filename_from_url "${nvim_url}")
    echo "file ${file_name}, install_target ${install_target_dir}"

    pushd .temp
    if [ ! -f ${file_name} ]; then
        wget ${nvim_url}
    fi
    extract_log="nvim_extract.log"
    tar -C ${install_target_dir} -xvf ${file_name} | tee ${extract_log}
    extract_dir=$(get_extrace_dir ${extract_log})
    echo "extract_dir is ${extract_dir}"
    rm -f ${extract_log}
    popd
    ln -sf ${install_target_dir}/${extract_dir}/bin/nvim ~/.local/bin/nvim
    touch .done/nvim-installed
    nvim -v
}

