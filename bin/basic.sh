#!/bin/bash

basic_packages=(
  $(command_exists git || echo git)
  $(command_exists zsh || echo zsh)
  $(command_exists wget || echo wget)
  $(command_exists curl || echo curl)
  $(command_exists neofetch || echo neofetch)
  # ...
)

install_basic(){
  update_packages

  if [[ ${#basic_packages[@]} != 0 ]]
  then
      sudo apt-get install ${basic_packages[@]} -y
  fi
  
  install_ohmyzsh

  success "Basic tools installed"
}

install_ohmyzsh(){
	if [[ -e /usr/bin/zsh && -e ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
		fail "Oh-My-Zsh is already installed!"
	else
		info "Installing Oh-My-Zsh"
		info "Based on: https://github.com/robbyrussell/oh-my-zsh/blob/master/README.md"

		if [[ ! -e /usr/bin/zsh ]]; then
			user "Zsh is required. Do you want install it? (y/n)"
			read choice;

			if [[ $choice == "y" ]]; then
				sudo apt update && sudo apt install zsh
				chsh -s $(which zsh)
				zsh --version
			fi
		fi

		if [[ -e /usr/bin/curl ]]; then
			cd
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
			cd -
		else
			if [[ -e /usr/bin/wget ]]; then
				cd
				sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
				cd -
			else
				user "curl or wget is required. Do you want install them? (y/n)"
				read choice;

				if [[ $choice == "y" ]]; then
					sudo apt update && sudo apt install wget curl
					smpc $_action $_option
				fi
			fi
		fi

		success "Oh-My-Zsh Installed"
	fi
}