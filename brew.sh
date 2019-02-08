#!/usr/bin/env bash

# Update homebrew and any already installed formulae.
brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU find, locate, updatedb, and xargs (g-prefixed).
brew install findutils

# Install GNU sed (overwrites build-in sed).
brew install gnu-sed --with-default-names

# Install more recent version of grep.
brew install grep

# Install something better than grep.
brew install ripgrep
brew install the_silver_searcher

# Install wget.
brew install wget

# Install bash 4 (the version packaged with macOS is outdated).
brew install bash
brew install bash-completion2

# Install zsh.
brew install zsh
brew install zsh-completions

# Install Python tools.
brew install pyenv
brew install pyenv-virtualenv
brew install pipenv

# Install golang and tools.
brew install go
brew install dep

# Install neovim.
brew install neovim

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install htop.
brew install htop

# Install fonts.
brew tap caskroom/fonts
brew cask install font-fira-code

# Remove outdated formulae.
brew cleanup
