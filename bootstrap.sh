#!/bin/sh

set -e

script_name=$(basename "${0}")
location="$(cd "$(dirname "${0}")" && pwd)"

script_name="$(basename "${0}")"
os="$(uname)"
hostname="$(hostname)"

ls_opts="1"
ln_opts="sin"

if [ "${1}" == "unsafe" ]; then
    ln_opts="sfn"
fi

bootstrap_dir () {
    local dotsdir="${1}"
    local filter_string="${2}"

    if ([ "${os}" = "FreeBSD" ] && [ $EUID -eq 0 ]); then
        ls_opts="${ls_opts}I"
    fi

    local filter="$(ls -${ls_opts} "${dotsdir}")"


    if [ -n "${filter_string}" ]; then
        filter="$(ls -${ls_opts} "${dotsdir}" | grep -vE "${filter_string}")"
    fi
    for f in $filter; do
        if [ "${f}" == "config" ]; then
            echo ".config directory found..."
            bootstrap_config_dir "${dotsdir}/${f}" "${HOME}/.${f}"
        elif ([ "${f}" != "${script_name}" ] && [ "${f}" != "README.md" ]); then
            echo "Linking ${HOME}/.${f} -> ${dotsdir}/${f}"
            ln -${ln_opts} ${dotsdir}/${f} ${HOME}/.${f} || continue
        fi
    done
}

bootstrap_config_dir () {
    local dotsdir="${1}"
    local configdir="${2}"
    local filter="$(ls -${ls_opts} "${dotsdir}")"
    for f in $filter; do
        if [ -d "${dotsdir}/${f}" ]; then
            if [ -d "${configdir}/${f}" ]; then
                echo "  Looking in ${configdir}/${f} ..."
                bootstrap_config_dir "${dotsdir}/${f}" "${configdir}/${f}"
            else
                echo "  Linking directory ${configdir}/${f} -> ${dotsdir}/${f}"
                ln -${ln_opts} ${dotsdir}/${f} ${configdir}/${f} || continue
            fi
        else
            if [ -f "${configdir}/${f}" ]; then
                echo "  Linking file ${configdir}/${f} -> ${dotsdir}/${f}"
                ln -${ln_opts} ${dotsdir}/${f} ${configdir}/${f} || continue
            fi
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

