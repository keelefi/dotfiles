#!/usr/bin/env bash

FILES=(
    .config/gtk-3.0/settings.ini
    .config/i3/config
    .config/i3status/config
    .gitconfig
    .gitignore
    .gtkrc-2.0
    .mozilla/firefox/profile.default/chrome/userChrome.css
    .tmux.conf
    .vimrc
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
        if [ -f "${file_destination}" ]; then
            echo "Showing diff between ${file_source} and ${file_destination}"
            echo
            diff -u "${file_destination}" "${file_source}"
            echo
        else
            echo "Destination ${file_destination} does not exist."
        fi
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

