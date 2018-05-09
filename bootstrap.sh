#!/usr/bin/env bash

# Preinstallations:

## Atom
sudo add-apt-repository ppa:webupd8team/atom

## R
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
echo "deb https://cran.rstudio.com/bin/linux/ubuntu `lsb_release -cs`/" | sudo tee -a /etc/apt/sources.list

## Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

## Rodeo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 33D40BC6
sudo add-apt-repository "deb http://rodeo-deb.yhat.com/ rodeo main"

## Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo "deb http://repository.spotify.com stable non-free" | sudo tee -a /etc/apt/sources.list

# Installations:
sudo apt update
sudo apt upgrade -y
sudo apt install -y --install-recommends vim git curl build-essential \
  r-base r-base-dev libssl-dev python3-dev python3-pip rodeo xsel atom \
  nodejs libxml2-dev jq libcupti-dev linux-headers-$(uname -r) \
  spotify-client wine-stable libcurl4-openssl-dev tesseract-ocr imagemagick scrot

## Now, let's get those dotfiles...
if [ ! -d ~/Projects ]; then
  mkdir ~/Projects
fi

if [ ! -d ~/Projects/dotfiles ]; then
  cd ~/Projects/
  git clone https://github.com/AABoyles/dotfiles.git
  rm ~/.bash_aliases ~/.bash_profile ~/.bashrc
  ln -s ~/Projects/dotfiles/.bash* ~
fi

# Non-Apt Installations:

## Node Packages
sudo npm i -g npm yarn http-server

## Python Packages
python3 -m pip install --upgrade pip
sudo pip3 install thefuck csvkit numpy pandas sklearn matplotlib \
  plotnine awscli aws-shell spacy howdoi jupyter jupyterlab
sudo jupyter serverextension enable --py jupyterlab --sys-prefix

## R Packages


## XGBoost
git clone --recursive https://github.com/dmlc/xgboost ~/Packages/xgboost
cd ~/Packages/xgboost
make -j4
cd python-package
sudo python3 setup.py install
cd ~

# Reset so the System Works the way you expect it to.
sudo shutdown -r now
