###############################################################################
# Environment
###############################################################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export TOOLS_HOME=$HOME/.tools
export GRADLE_HOME=/opt/gradle
export GRADLE_USER_HOME=$HOME/.gradle
export M2_HOME=/opt/maven
export JAVA_HOME=/opt/jdk
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$M2_HOME/lib
export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=/opt/go
export GOPATH=$HOME/.go
export GOPROXY=https://goproxy.cn
export GO111MODULE=on
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GRADLE_HOME/bin
export PATH=$PATH:$HOME/.pyenv/bin
export PATH=$PATH:/usr/bin/websocketd
export PATH=$PATH:$GRADLE_HOME/bin
export PATH=$PATH:/usr/local/opt/mysql-client/bin

# 引用其他配置文件
for file in $(find $HOME/.tools/ -type f -name "*.alias"); do
	source $file
done

alias dev='~/.WorkScript/login.sh dev'
alias stage='~/.WorkScript/login.sh stage'
###############################################################################
# Basics
###############################################################################
mac() { [ "$(uname)" = "Darwin" ] && return 0; return 1; }
linux() { [ "$(expr $(uname -s) | cut -c 1-5)" = "Linux" ] && return 0; return 1; }
windows() { [ "$(expr $(uname -s) | cut -c 1-10)" = "MINGW32_NT" ] && return 0; return 1; }
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ls='_ls() { (mac && \ls -G $@) || (linux && \ls --color=auto $@) }; _ls'
alias ll='ls -lh'
alias lls='ll -Sr'
alias llr='ll -tr'
alias lla='ls -la'
alias du='du -h'
alias df='df -h'
alias o='open_window'
alias o.='open_window .'
alias o..='open_window ..'
alias vzsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias vimrc='vim ~/.config/nvim/init.vim'
alias c='clear'
alias x='extract'
alias vim='nvim'
alias oldvim='\vim'
alias snip='cd ~/.config/nvim/UltiSnips'
alias imgpush='~/.yun-notes-image/upload.sh'
alias phps='php -S localhost:8000'
alias vhost='vim /etc/hosts'

ip() {
	(mac || linux) && ifconfig | grep -e '.*192\.168.*';
	windows && ipconfig | grep -e '.*192\.168.*';
}

kp() {
	list=$(sudo lsof -i -sTCP:LISTEN);
	PID=$(echo $list | fzf | awk '{print $2}');
	[ -n "$PID" ] && sudo kill -9 $PID;
}

open_window() {
    mac && open $1;
    linux && nautilus $1;
    windows && explorer $1;
}

extract() {
    if [ -f $1 ] ; then
                case $1 in
                        *.tar.bz2) tar xjf $1     ;;
                        *.tar.gz)  tar xzf $1     ;;
                        *.bz2)     bunzip2 $1     ;;
                        *.rar)     unrar e $1     ;;
                        *.gz)      gunzip $1      ;;
                        *.tar)     tar xf $1      ;;
                        *.tbz2)    tar xjf $1     ;;
                        *.tgz)     tar xzf $1     ;;
                        *.zip)     unzip $1       ;;
                        *.Z)       uncompress $1  ;;
                        *.7z)      7z x $1        ;;
                        *)         echo "'$1' cannot be extracted" ;;
                esac
        else
                echo "'$1' is not a valid file"
    fi
}

for file in $(find $HOME/.tools/ -type f -name "*.alias"); do
    source $file
done
###############################################################################
# Git
###############################################################################
alias st='git status -sb'
alias add='git add --all'
alias cm='git commit -m'
alias pull='git pull origin'
alias push='git push origin'
alias pushu='git_push_trace'
alias pushf='git_push_force'
alias co='git checkout'
alias cor='git_checkout_origin'
alias br='git branch'
alias bs="git branch | fzf --height 80% | sed 's/\*\|\s//g' | xargs git checkout"
alias bd="git branch | fzf -m --height 80% | sed 's/\*\|\s//g' | xargs git branch -D"

alias rets='git reset --soft'
alias retm='git reset --mixed'
alias reth='git reset --hard'
alias retsh='rets(){ git reset --soft HEAD~$1; }; rets'
alias retmh='retm(){ git reset --mixed HEAD~$1; }; retm'
alias rethh='reth(){ git reset --hard HEAD~$1; }; reth'

alias gme='git merge --no-ff'
alias gtag='git tag -l'
alias grem='git remote -v'
alias grmc='git rm -r --cached .'
alias gss='git stash save'
alias gsl='git stash list'
alias gsa='gsa(){ git stash apply stash@{$1}; }; gsa'
alias gsd='gsd(){ git stash drop stash@{$1}; }; gsd'
alias glog="git log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'"
alias gconf='git_init_config'

gdff() {
	preview="git diff $@ --color=always -- {-1}"
	git diff $@ --name-only | fzf -m --ansi --preview $preview
}
git_push_trace() { cbranch=$(git symbolic-ref --short HEAD); git push -u origin $cbranch; }
git_push_force() { cbranch=$(git symbolic-ref --short HEAD); git push -f origin $cbranch; }
git_checkout_origin() { git checkout -b $1 origin/$1; }
git_init_config() {
	git config --global user.name "liuyun"
    git config --global user.email "liuyunplus@gmail.com"
	git config --global core.ignorecase false
    git config --global core.quotepath false
    git config --global gui.encoding utf-8
    git config --global i18n.commit.encoding utf-8
    git config --global i18n.logoutputencoding utf-8
    git config --global core.pager "less -F -X"
    git config --global core.editor vim
    git config --global core.excludesfile ~/.gitignore
    # Linux
    export LESSCHARSET=utf-8
    # Windows
    set LESSCHARSET=utf-8
}
###############################################################################
# Maven
###############################################################################
alias mcl='mvn clean'
alias mco='mvn compile'
alias min='mvn clean install -Dmaven.test.skip=true'
alias mpa='mvn clean package -Dmaven.test.skip=true'
alias mdp='mvn deploy'
alias mtr='mvn dependency:tree'
alias mds='mvn dependency:sources'
alias mdc='mvn dependency:copy-dependencies -DincludeScope=runtime'
alias mcn='find ~/.m2 -name "*.lastUpdated" | xargs rm -rf'
###############################################################################
# Gradle
###############################################################################
alias grb='gradle build -x test'
###############################################################################
# Docker
###############################################################################
alias d='docker'
alias drun='docker run'
alias drm='docker rm'
alias drme="docker rm \$(docker ps -a | grep \"Exited\" | awk '{print \$1}')"
alias drmi='docker rmi'
alias drmin="docker rmi \$(docker images | grep \"none\" | awk '{print \$3}')"
alias dstart='docker start'
alias dstop='docker stop'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dexec='dexec() { docker exec -it $1 bash }; dexec'
alias dlogs='docker logs'
alias dlogsf='docker logs -f'
alias dimg='docker images'
alias dpull='docker pull'
###############################################################################
# Go
###############################################################################
alias gb='go build'
alias gr='go run'
###############################################################################
# Python
################################################################################
alias python='~/.pyenv/bin/python'
alias pip='~/.pyenv/bin/python -m pip'
alias pls='pip list'
alias pins='pip install'
alias puni='pip uninstall'
alias pfr='pip freeze > requirements.txt'
alias pir='pip install -r requirements.txt'
###############################################################################
# NodeJs
#################################################################################
alias nls='npm list --depth 0'
alias nins='npm install'
alias nuni='npm uninstall'
alias nup='npm update'
alias nlsg='npm list -g --depth 0'
alias ninsg='npm install -g'
alias nunig='npm uninstall -g'
alias nupg='npm update -g'
###############################################################################
# Nginx
#################################################################################
alias ngstart='sudo nginx'
alias ngstop='sudo nginx -s stop'
alias ngreload='sudo nginx -s reload'
alias ngconf='vim /etc/nginx/nginx.conf'

