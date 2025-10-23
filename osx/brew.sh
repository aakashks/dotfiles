#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${HOMEBREW_PREFIX}/bin/gsha256sum" "${HOMEBREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# # Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
# brew install grep
# brew install openssh
# brew install screen
# brew install php
# brew install gmp

# # Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# # Install other useful binaries.
# brew install ack
# #brew install exiv2
brew install git
brew install git-lfs
# brew install gs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
# brew install ssh-copy-id
brew install tree
# brew install vbindiff
# brew install zopfli


# My custom installs
brew install google-chrome
brew install visual-studio-code

brew install maccy
brew install iterm2
brew install unnaturalscrollwheels
# brew install linear-mouse


brew install miniconda
brew install uv
brew install wget
brew install ripgrep
brew install ugrep
brew install fzf
brew install zoxide
brew install dust
brew install exa
brew install bat
brew install fd
brew install starship
brew install pandoc
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install zotero
brew install obsidian
brew install textmate
brew install slack
brew install notion
brew install jetbrains-toolbox
brew install adobe-acrobat-reader
brew install google-drive

# brew install zoom --cask
# brew install arc
# brew install sublime-text
# brew install docker --cask
# brew install rectangle
# brew install alt-tab
# brew install hiddenbar
# brew install localsend
# brew install android-file-transfer
# brew install go

# utilities
brew install pandoc
brew install rsync
brew install croc
brew install aria2
# brew install texlive
# brew install blackhole-2ch
# brew install iina
# brew install obs
# brew install cloudflare-warp
# brew install ffmpeg
# brew install youtube-dl

# fonts
brew install font-ibm-plex-mono
brew install font-jetbrains-mono-nerd-font

# Remove outdated versions from the cellar.
brew cleanup
