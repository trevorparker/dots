#!/bin/sh

set -e

script_name=$(basename "${0}")
location="$(cd "$(dirname "${0}")" && pwd)"

script_name="$(basename "${0}")"
os="$(uname)"
hostname="$(hostname)"

function bootstrap_dir {
    local dir="${1}"
    local filter_string="${2}"

    local filter="$(ls -1 "${dir}")"

    if [ -n "${filter_string}" ]; then
        filter="$(ls -1 "${dir}" | grep -vE "${filter_string}")"
    fi
    for f in $filter; do
        if [ "${f}" != "${script_name}" -a "${f}" != "README.md" ]; then
            echo "Linking ${HOME}/.${f} -> ${dir}/${f}"
            ln -sfn ${dir}/${f} ${HOME}/.${f}
        fi
    done
}

bootstrap_dir "${location}" '^h?ost?$'

# OS-specific configs
if [ -d "${location}/os/${os}" ]; then
    bootstrap_dir "${location}/os/${os}"
fi

# Host-specific configs
if [ -d "${location}/host/${hostname}" ]; then
    bootstrap_dir "${location}/host/${hostname}"
fi

