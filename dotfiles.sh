#!/usr/bin/env bash

FILES=(
    .gitconfig
    .gitignore
    .tmux.conf
    .vimrc
    .config/i3/config
    .config/i3status/config
    .config/gtk-3.0/settings.ini
    )

function run_diff_all {
    echo "Not implemented :-)"
}

function run_diff {
    file=$1

    if [ -z "${file}" ]; then
        run_diff_all
    else
        file_source=${file}
        file_destination=${HOME}/${file}
        echo "Showing diff between ${file_source} and ${file_destination}"
        diff -u "${file_source}" "${file_destination}"
    fi
}

function list_diffs {
    for file in "${FILES[@]}"; do
        file_source=${file}
        file_destination=${HOME}/${file}
        if [ -f "${file_destination}" ]; then
            diff -q "${file_source}" "${file_destination}"
        else
            echo "${file}: ${file_destination} does not exist!"
        fi
    done
}

function run_install_all {
    echo "Not implemented :-)"
}

function run_install {
    file=$1

    if [ -z "${file}" ]; then
        run_install_all
    else
        file_source=${file}
        file_destination=${HOME}/${file}
        echo "Installing ${file_source} to ${file_destination}..."
        cp "${file_source}" "${file_destination}"
        echo "Done!"
    fi
}

runcommand=$1
file=$2

case "${runcommand}" in
    diff)
        run_diff "${file}"
        ;;
    list)
        list_diffs
        ;;
    install)
        run_install "${file}"
        ;;
esac

