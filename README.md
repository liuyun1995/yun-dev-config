# yun-dev-config
#### 1.配置国内镜像源

sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup  
wget https://raw.githubusercontent.com/liuyun1995/yun-dev-config/master/ubuntu/sources.list -O /etc/apt/sources.list

#### 2.更新软件源

sudo apt-get update  
sudo apt-get upgrade  
备注：如果没有公钥报错，则执行下条语句  
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${key}

#### 3.安装软件

sudo apt install zsh  
sudo apt-get install git  
sudo apt-get install build-essential  
sudo apt-get install curl  
sudo apt-get install vim  
sudo apt-get install neovim  
sudo apt-get install flameshot  
sudo apt-get install fzf  
sudo apt-get install nodejs  
sudo apt-get install npm  
sudo apt-get install python3-venv

#### 4.设置英文目录

export LANG=en_US  
xdg-user-dirs-gtk-update  
export LANG=zh_CN

#### 5.配置github密钥

mkdir ~/.ssh; cd ~/.ssh  
ssh-keygen -m PEM -t rsa -b 4096 -N '' -C "liuyunplus@gmail.com" -f id_rsa_github  
cat ~/.ssh/id_rsa_github.pub

#### 5.安装Oh-My-Zsh

chsh -s /bin/zsh  
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

#### 6.执行后续安装

wget https://raw.githubusercontent.com/liuyun1995/yun-dev-config/master/init.sh -O - | sh
