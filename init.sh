#!/bin/bash

path=$(pwd)

config_zsh() {
	rm -rf ~/.zshrc
	ln -sf $path/zshrc ~/.zshrc
}

config_vim() {
	rm -rf ~/.config/nvim
	ln -sf $path/nvim ~/.config/nvim
}

config_git() {
	rm -rf ~/.gitconfig
	rm -rf ~/.gitignore
	ln -sf $path/git/gitconfig ~/.gitconfig
	ln -sf $path/git/gitignore ~/.gitignore
}

config_ssh() {
	rm -rf ~/.ssh/config
	ln -sf $path/ssh/config ~/.ssh/config

	ssh_home=$HOME/.ssh
	if [ ! -f "$ssh_home/id_rsa_github" ]; then
		ssh-keygen -q -m PEM -t rsa -b 4096 -N '' -C "liuyunplus@gmail.com" -f $ssh_home/id_rsa_github
	fi
	if [ ! -f "$ssh_home/id_rsa_gitee" ]; then
		ssh-keygen -q -m PEM -t rsa -b 4096 -N '' -C "liuyunplus@gmail.com" -f $ssh_home/id_rsa_gitee
	fi
}

config_python() {
	rm -rf ~/.pip
	ln -sf $path/python/pip ~/.pip
}

config_latexmkrc() {
	rm -rf ~/.latexmkrc
	ln -sf $path/latex/latexmkrc ~/.latexmkrc
}

config_tools() {
	rm -rf ~/.tools
	ln -sf $path/tools ~/.tools
}

config_zsh
config_vim
config_git
config_ssh
config_python
config_latexmkrc
config_tools
echo "配置成功！"
