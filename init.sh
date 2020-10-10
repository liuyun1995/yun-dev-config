#!/bin/sh

path=$(pwd)

rm -rf ~/.config/nvim
rm -rf ~/.zshrc
rm -rf ~/.tools
rm -rf ~/.pip
rm -rf ~/.ssh/config
rm -rf ~/.latexmkrc

ln -sf $path/nvim ~/.config/nvim
ln -sf $path/zshrc ~/.zshrc
ln -sf $path/tools ~/.tools
ln -sf $path/python/pip ~/.pip
ln -sf $path/ssh/config ~/.ssh/config
ln -sf $path/latex/latexmkrc ~/.latexmkrc

echo "配置成功！"
