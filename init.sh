#!/bin/sh

path=$(pwd)
rm -rf ~/.config/nvim
rm -rf ~/.zshrc
rm -rf ~/.tools
ln -s $path/nvim ~/.config/nvim
ln -s $path/zshrc ~/.zshrc
ln -s $path/tools ~/.tools
echo "配置成功！"
