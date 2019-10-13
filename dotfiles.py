#!/usr/bin/env python3.7
"""Module docstring."""

import filecmp
from os.path import expanduser

from typing import List, Tuple
from shutil import copyfile

import click


DOTFILES: List[Tuple[str, str]] = [("~/.tmux.conf", "tmux.conf"), ("~/.vimrc", "vimrc")]


@click.group()
def main():
    """Pass."""


@main.command()
def deploy():
    """Deploy the dotfiles."""
    dotfiles: Tuple[str, str] = [(expanduser(df[0]), df[1]) for df in DOTFILES]

    for system_file, my_file in dotfiles:
        click.secho(system_file)
        if not filecmp.cmp(my_file, system_file):
            copyfile(my_file, system_file)
        else:
            click.secho("> Files are the same, skipping", fg="yellow")
