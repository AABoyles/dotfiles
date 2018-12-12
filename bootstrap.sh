#!/usr/bin/env bash

## Core Libs
sudo apt update && sudo apt upgrade -y
sudo apt install -y --install-recommends \
  linux-headers-$(uname -r) software-properties-common \
  build-essential curl libssl-dev vim git \
  xsel libxml2-dev jq \
  wine-stable libcurl4-openssl-dev \
  tesseract-ocr imagemagick scrot zsh conky-all lm-sensors

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

## Python 3
sudo apt install -y python3 python3-dev python3-pip jupyter-core

## Python Packages
sudo python3 -m pip install --upgrade pip
sudo pip3 install thefuck csvkit numpy pandas sklearn matplotlib \
  plotnine awscli aws-shell spacy howdoi

## R
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
echo "deb https://cran.rstudio.com/bin/linux/ubuntu `lsb_release -cs`/" | sudo tee -a /etc/apt/sources.list
sudo apt install -y --install-recommends r-base r-base-dev

### R Packages
/usr/bin/Rscript -e "install.packages('tidyverse')"

## Node
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

### Node Packages
sudo npm i -g http-server

### [Atom](https://atom.io/)
cd ~/Downloads/
curl https://atom.io/download/deb
sudo dpkg -i atom-amd64.deb

## [Rust](https://www.rust-lang.org/)
sudo apt install -y rustc cargo

### [XSV](https://github.com/BurntSushi/xsv#readme)
sudo cargo install xsv

## [Haskell]()
sudo apt-get install -y haskell-platform
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-2.4 ghc-8.4.4
sudo stack upgrade --binary-only

## Oh My zsh
# curl -L http://install.ohmyz.sh | sh
# cd ~/.oh-my-zsh && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# sudo chsh -s `which zsh`

## [Hosts](https://github.com/StevenBlack/hosts)
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts | sudo tee -a /etc/hosts

# Reset so the System Works the way you expect it to.
sudo shutdown -r now
