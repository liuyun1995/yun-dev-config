#!/bin/sh

#最小安装
function min_install() {
    install_jdk
    install_git
    install_maven
    config_zsh
    config_vim
}

#安装JDK
function install_jdk() {
    echo "============ install jdk start ============";
    if [ -x "$(command -v java)" ]; then
        echo "已安装Java"
    else
        echo "未安装java"
    fi
}

#安装Git
function install_git() {
    echo "============ install git start ============";
    if [ -x "$(command -v git)" ]; then
        echo "已安装git"
    else
        echo "未安装git"
    fi
}

#安装Maven
function install_maven() {
    echo "============ install maven start ============";
    if [ -x "$(command -v mvn)" ]; then
        echo "已安装maven"
    else
        echo "未安装maven"
    fi
}

#配置ZSH
function config_zsh() {
    echo "============ config zsh start ============";
}

#配置VIM
function config_vim() {
    echo "============ config vim start ============";
}

min_install