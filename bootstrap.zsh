#!/usr/bin/env zsh

## Homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

brew install lsd
brew install hub

## Now, let's get those dotfiles...
if [ ! -d ~/Projects ]; then
  mkdir ~/Projects
fi

if [ ! -d ~/Projects/dotfiles ]; then
  cd ~/Projects/
  git clone https://github.com/AABoyles/dotfiles.git
  rm ~/.zsh_aliases ~/.zsh_exports ~/.zsh_profile ~/.zshrc
  ln -s ~/Projects/dotfiles/.zshrc ~/.zshrc
  ln -s ~/Projects/dotfiles/.bash_aliases ~/.zsh_aliases
fi

# pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

## Python Packages
python3 -m pip install --upgrade pip
sudo pip3 install numpy pandas scikit-learn matplotlib \
  plotnine awscli spacy jupyter

## R
# TODO: Install R

### R Packages
# TODO: Install R
#/usr/bin/Rscript -e "install.packages(c('tidyverse', 'plotly', 'shiny'))"

## Node Version Manager
# TODO: Not working
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

### Node Packages
npm i -g http-server

### [Atom](https://atom.io/)
cd ~/Downloads/

## [Hosts](https://github.com/StevenBlack/hosts)
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts | sudo tee -a /etc/hosts

# Reset so the System Works the way you expect it to.
sudo shutdown -r now
