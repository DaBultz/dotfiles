#!/bin/env zsh

if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	printf "\033[0;31m[ERROR] oh-my-zsh is already installed skipping...\033[0m\n"
fi



