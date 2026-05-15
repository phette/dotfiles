#!/usr/bin/env bash

# Update homebrew and any already installed formulae.
brew update
brew upgrade

# Install bash 4 (the version packaged with macOS is outdated).
brew install bash
brew install bash-completion2

# Install zsh.
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install zsh-vi-mode

# Install Pure prompt.
brew install pure

# Install neovim.
brew install neovim

# Neovim runtime dependencies (includes better grep).
brew install ripgrep
brew install fd
brew install lazygit

# Install fonts.
brew install --cask font-fira-code-nerd-font

# Install Python tools.
brew install pyenv
brew install pyenv-virtualenv
brew install pipenv

# Install golang and tools. Don't forget to set up ~/.docker/config.json.
brew install go
brew install docker-credential-helper-ecr

# Install wget.
brew install wget

# Better alternative to cat with syntax highlighting and git integration.
brew install bat

# More welcoming ping.
brew install prettyping

# JSON parsing tool.
brew install jq

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install htop.
brew install htop

# Remove outdated formulae.
brew cleanup
