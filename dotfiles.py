#!/usr/bin/env python3.8
import filecmp
from pathlib import Path
from shutil import copyfile
from typing import List
from typing import NamedTuple

import click


class Dotfile(NamedTuple):
    my_config: Path
    system_path: Path


DOTFILES: List[Dotfile] = [
    Dotfile(my_config=Path("tmux.conf"), system_path=Path("~/.tmux.conf").expanduser()),
    Dotfile(my_config=Path("vimrc"), system_path=Path("~/.vimrc").expanduser()),
]


@click.group()
def main():
    """Manage system dotfiles."""


@main.command()
def deploy():
    """Deploy DOTFILES to system.

    If the `system_path` of the dotfile already exists and matches the repo version,
    do nothing. Otherwise, copy the repo config to the system path, overwriting
    anything that might be there.

    """
    for my_config, system_path in DOTFILES:
        click.secho(f"> {my_config.absolute()} -> {system_path.absolute()}", fg="blue")

        if not system_path.exists():
            click.secho(f"> {system_path} does not exist, creating", fg="green")
        elif filecmp.cmp(my_config, system_path):
            click.secho(f"> {system_path} is the same, skipping", fg="yellow")
            continue

        click.secho(f"> Deploying config to {system_path}", fg="green")
        copyfile(my_config, system_path)
