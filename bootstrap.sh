#!/usr/bin/env bash

# Preinstallations:

## Wine
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

## R
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
echo "deb https://cran.rstudio.com/bin/linux/ubuntu `lsb_release -cs`" | sudo tee -a /etc/apt/sources.list

## Rodeo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 33D40BC6
sudo add-apt-repository "deb http://rodeo-deb.yhat.com/ rodeo main"

## Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

## Node
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

# Installations:
sudo apt update
sudo apt upgrade -y
sudo apt install -y --install-recommends vim chrome-gnome-shell curl arc-theme \
  nodejs build-essential r-base r-base-dev libssl-dev python3-dev python3-pip \
  xsel spotify-client winehq-stable rodeo libxml2-dev jq libcupti-dev linux-headers-$(uname -r)

## Now, let's get those dotfiles...
if [ ! -d ~/Projects ]; then
  mkdir ~/Projects
fi

if [ ! -d ~/Projects/dotfiles ]; then
  git clone https://github.com/AABoyles/dotfiles.git ~/Projects
  rm ~/.bash_aliases ~/.bash_profile ~/.bashrc
  ln -s ~/Projects/dotfiles/.bash* ~
fi

# Non-Apt Installations:

## XGBoost
if [ ! -d ~/Packages ]; then
  mkdir ~/Packages
fi
git clone --recursive https://github.com/dmlc/xgboost ~/Packages
cd ~/Packages/xgboost
make -j4
cd python-package
sudo python3 setup.py install
cd ~

## Python Packages
sudo pip3 install thefuck csvkit numpy pandas sklearn matplotlib plotnine awscli aws-shell spacy
python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter
sudo pip3 install jupyterlab
sudo jupyter serverextension enable --py jupyterlab --sys-prefix

## R Packages


## Node Packages
sudo npm i -g npm
sudo npm i -g http-server

# Reset so the System Works the way you expect it to.
sudo shutdown -r now
