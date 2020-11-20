###############################################################################
# Env settings
###############################################################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export TOOLS_HOME=$HOME/.tools
export M2_HOME=/opt/apache-maven-3.6.3
export JAVA_HOME=/opt/jdk1.8.0_251
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib:$M2_HOME/lib

export GOROOT=/opt/go
export GOPATH=$HOME/Public/MyPro/GoPro
export GOPROXY=https://goproxy.cn
export GO111MODULE=on
export PATH="$PATH:${JAVA_HOME}/bin:$M2_HOME/bin:$GOROOT/bin:$GOPATH/bin"
###############################################################################
# Shell Imporvement
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
alias upimg='~/.yun-notes-image/upload.sh'
alias phps='php -S localhost:8000'

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
alias gconf='git_config'
alias st='git status -sb'
alias add='git add --all'
alias cm='git commit -m'
alias pull='git pull origin'
alias push='git push origin'
alias br='git branch'
alias co='git checkout'
alias merge='git merge --no-ff'
alias bs="git branch | fzf --height 80% | sed 's/\*\|\s//g' | xargs git checkout"
alias bd="git branch | fzf -m --height 80% | sed 's/\*\|\s//g' | xargs git branch -D"

alias rets='git reset --soft'
alias retm='git reset --mixed'
alias reth='git reset --hard'
#撤销Commit, 不撤销Add, 不撤销工作代码
alias retsh='rets(){ git reset --soft HEAD~$1; }; rets'
#撤销Commit, 撤销Add, 不撤销工作代码
alias retmh='retm(){ git reset --mixed HEAD~$1; }; retm'
#撤销Commit, 撤销Add, 撤销工作代码
alias rethh='reth(){ git reset --hard HEAD~$1; }; reth'

alias reb='git rebase'
alias rebi='git rebase -i'
alias rebih='rebih(){ git rebase -i HEAD~$1; }; rebih'

alias diff='git diff'
alias tags='git tag -l'
alias rem='git remote -v'
alias rmc='git rm -r --cached .'
alias gss='git stash save'
alias gsl='git stash list'
alias gsa='gsa(){ git stash apply stash@{$1}; }; gsa'
alias gsd='gsd(){ git stash drop stash@{$1}; }; gsd'


#删除远程分支或标签
alias gdel='git push origin --delete'
alias glog="git log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'"

cor() {
	git checkout -b $1 origin/$1
}

pushu() {
	cbranch=$(git symbolic-ref --short HEAD)
	git push -u origin $cbranch
}

git_config() {
	git config --global user.name "lewis"
    git config --global user.email lewis.liu@ihr360.com
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
alias ml='mvn clean'
alias mc='mvn compile'
alias mi='mvn install -Dmaven.test.skip=true'
alias md='mvn deploy'
alias mdt='mvn dependency:tree'
alias mds='mvn dependency:sources'
alias mdc='mvn dependency:copy-dependencies -DincludeScope=runtime'
alias mcr='find ~/.m2 -name "*.lastUpdated" | xargs rm -rf'
###############################################################################
# Docker
###############################################################################
alias dk='docker'
alias dkc='docker create'

alias dkr='docker run'
alias dkrr='docker run --rm'

alias dkri='docker run -i -t'
alias dkrri='docker run --rm -i -t'

alias dkrd='docker run -d'
alias dkrrd='docker run --rm -d'

alias dkrm='docker rm'
alias dkrmi='docker rmi'

alias dks='docker start'
alias dksi='docker start -i'
alias dkrs='docker restart'
alias dkstop='docker stop'

alias dki='docker inspect'
alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dktop='docker top'

alias dke='docker exec'
alias dkei='docker exec -i -t'
alias dkl='docker logs'
alias dklf='docker logs -f'

alias dkimg='docker images'
alias dkp='docker pull'
alias dksh='docker search'
###############################################################################
# Go
###############################################################################
alias gb='go build'
alias gr='go run'

alias python='~/.pyenv/bin/python'
alias pip='~/.pyenv/bin/python -m pip'
