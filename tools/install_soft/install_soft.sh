#!/bin/sh

echo ".......安装脚本"

#安装JDK
install_jdk() {
    echo "============ install jdk start ============";
    if [ -x "$(command -v java)" ]; then
        echo "已安装Java"
    else
        echo "未安装java"
    fi
}

#安装Git
install_git() {
    echo "============ install git start ============";
    if [ -x "$(command -v git)" ]; then
        echo "已安装git"
    else
        echo "未安装git"
    fi
}

#安装Maven
install_maven() {
    echo "============ install maven start ============";
    if [ -x "$(command -v mvn)" ]; then
        echo "已安装maven"
    else
        echo "未安装maven"
    fi
}

#配置ZSH
config_zsh() {
    echo "============ config zsh start ============";
}

#配置VIM
config_vim() {
    echo "============ config vim start ============";
}