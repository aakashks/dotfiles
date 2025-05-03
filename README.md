# Dotfiles

My personal collection of dotfiles, configuration files, and utility scripts for setting up development environments on Linux and macOS.

## Overview

This repository contains configurations for various tools and shells, aiming for a consistent setup across different machines.

## Installation / Setup

There are two primary ways to use these dotfiles:

### 1. Local Sync (Recommended for Linux/Complex Setups)

This method uses `rsync` to copy files to a remote machine. It requires SSH access to the target machine.

**Prerequisites:**

*   SSH key added to the remote server's `~/.ssh/authorized_keys`.
*   `rsync`, `git`, `tmux`, `build-essential`, `gcc` installed on the remote server. You can install them using:
    ```bash
    ssh <ssh_alias> "sudo -n true && sudo apt update && sudo apt install rsync git tmux zip unzip tar build-essential gcc -y"
    ```
*   Update placeholder values in [`.netrc`](.netrc) and [`.gitconfig`](.gitconfig) with your credentials *before* running the script.
*   You can also add standalone binaries to `.local/bin/` before running the script to copy them to the remote machine.

**Usage:**

```bash
./setup_from_local.sh <ssh_alias>
```

This script will:
1.  Sync specified dotfiles and directories to the remote home directory using [`rsync`](setup_from_local.sh).
2.  Execute the remote [`setup.sh`](setup.sh) script via SSH, which handles permissions, updates `~/.bashrc`, installs Miniconda (if needed), sets up a default conda environment, and clones specified repositories.

### 2. Standalone Installation (Cloud/Simpler Setups)

This method uses a single script downloaded via `wget`. It's suitable for fresh cloud instances.

**Prerequisites:**

*   Edit the [`scripts/standalone.sh`](scripts/standalone.sh) script and replace placeholder values (SSH keys, API keys, Git config, project repos) with your actual information *before* running the command.

**Usage:**

```bash
# Make sure to use the raw URL of your edited script
wget <raw_url_to_your_standalone.sh> && bash standalone.sh
```
*Or for the default version (requires editing after download or manual setup):*
```bash
wget https://raw.githubusercontent.com/aakashks/dotfiles/main/scripts/standalone.sh && \
bash standalone.sh
```

### macOS Setup

For macOS, use the scripts and configurations within the [`osx/`](osx/) directory:

1.  Run [`osx/brew.sh`](osx/brew.sh) to install applications and tools via Homebrew.
2.  Symlink or copy configuration files like [`osx/.zshrc`](osx/.zshrc), [`osx/.zsh_aliases`](osx/.zsh_aliases), and [`osx/starship.toml`](osx/starship.toml) to your home directory.

## References

-   Inspired by [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles).
