# My dotfiles

This repository contains my dotfiles. Additionally, it contains a helper script to manage the distribution of updates to them.

## Usage

To see which files have changes, use `list`:

    ./dotfiles.sh list

To view diffs of a single configuration files, use `diff`:

    ./dotfiles.sh diff <file>

To install the provided configuration, use `install`:

    ./dotfiles.sh install <file>

## Updating the script

Remember to run shellcheck before pushing updates to the script:

    shellcheck dotfiles.sh
