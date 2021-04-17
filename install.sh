#!/bin/bash

path=$(pwd)

config_zsh() {
	echo "================ 开始配置zsh ================"
	rm -rf ~/.zshrc
	ln -sf $path/zshrc ~/.zshrc
}

config_vim() {
	echo "================ 开始配置vim ================"
	rm -rf ~/.config/nvim
	ln -sf $path/nvim ~/.config/nvim
}

config_git() {
	echo "================ 开始配置git ================"
	rm -rf ~/.gitconfig
	rm -rf ~/.gitignore
	ln -sf $path/git/gitconfig ~/.gitconfig
	ln -sf $path/git/gitignore ~/.gitignore
}

config_ssh() {
	echo "================ 开始配置ssh ================"
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
	echo "================ 开始配置python ================"
	rm -rf ~/.pip
	ln -sf $path/python/pip ~/.pip
	python3 -m venv ~/.pyenv
}

config_latexmkrc() {
	echo "================ 开始配置latex ================"
	rm -rf ~/.latexmkrc
	ln -sf $path/latex/latexmkrc ~/.latexmkrc
}

config_tools() {
	echo "================ 开始配置tools ================"
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

echo "安装成功！"
