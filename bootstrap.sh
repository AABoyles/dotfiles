#!/usr/bin/env bash

## Core Libs
sudo apt update && sudo apt upgrade -y
sudo apt install -y --install-recommends \
  linux-headers-$(uname -r) software-properties-common \
  build-essential curl libssl-dev vim git \
  xsel libxml2-dev jq \
  wine-stable libcurl4-openssl-dev \
  tesseract-ocr imagemagick scrot zsh conky-all lm-sensors \
  thefuck

## Now, let's get those dotfiles...
if [ ! -d ~/Projects ]; then
  mkdir ~/Projects
fi

if [ ! -d ~/Projects/dotfiles ]; then
  cd ~/Projects/
  git clone https://github.com/AABoyles/dotfiles.git
  # rm ~/.bash_aliases ~/.bash_exports ~/.bash_profile ~/.bashrc ~/.zshrc
  ln -s ~/Projects/dotfiles/.* ~
  # ln -s ~/Projects/dotfiles/.zsh* ~
fi

## Python Packages
python3 -m pip install --upgrade pip
sudo pip3 install numpy pandas sklearn matplotlib \
  plotnine awscli spacy jupyter

## R
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
echo "deb https://cran.rstudio.com/bin/linux/ubuntu `lsb_release -cs`/" | sudo tee -a /etc/apt/sources.list
sudo apt install -y --install-recommends r-base r-base-dev

### R Packages
sudo /usr/bin/Rscript -e "install.packages('tidyverse')"

## Node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

### Node Packages
npm i -g http-server

### [Atom](https://atom.io/)
cd ~/Downloads/
curl https://atom.io/download/deb
sudo dpkg -i atom-amd64.deb

## [Hosts](https://github.com/StevenBlack/hosts)
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts | sudo tee -a /etc/hosts

## hub
sudo snap install hub --classic
curl https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh > ~/Projects/dotfiles/ignored/hub.bash_completion.sh

## Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Reset so the System Works the way you expect it to.
sudo shutdown -r now
