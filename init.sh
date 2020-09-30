#!/bin/sh

path=$(pwd)

rm -rf ~/.config/nvim
rm -rf ~/.zshrc
rm -rf ~/.tools
rm -rf ~/.pip
rm -rf ~/.ssh/config

ln -s $path/nvim ~/.config/nvim
ln -s $path/zshrc ~/.zshrc
ln -s $path/tools ~/.tools
ln -s $path/python/pip ~/.pip
ln -s $path/ssh/config ~/.ssh/config

echo "配置成功！"
