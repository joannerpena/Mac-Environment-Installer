#!/bin/sh
#
#
# Title : Development Environment Installer
# Joanner Pena
# Github: joannerpena
# Version: v1.0.0
# Date: 12/23/2019
#
# Script install everything needed to work with Web and Mobile Development for Mac
#
clear

RED="\033[0;31m"
NC="\033[0m"
GREEN="\033[0;32m"
BLUE="\33[0;34m"


echo "Welcome to Mac Development Environment Installer Script by Joannerpena\n"

## GENERAL PURPOSE // MUST-HAVE
# //////////////////////////////////////////////////////////////////////////////// #
echo "\n${GREEN}Starting Installation...\n"
echo "${NC}==================== ${GREEN}GENERAL PURPOSE INSTALLATION${NC} ====================\n"

# Install Homebrew
echo "${NC}==================== ${GREEN}Homebrew${NC} ====================\n"
if ! [ -x "$(command -v brew)" ]; then
    echo "${GREEN}~ ${NC}Installing homebrew...\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update repository
echo "\n${GREEN}~ ${NC}Updating homebrew repository...\n"
brew update

# Check if it's working
echo "\n${GREEN}~ ${NC}Check if homebrew is installed correctly...\n"
brew doctor

echo "Press any button to continue..."
read

# Install Mac Development Tools
echo "\n${NC}==================== ${GREEN}Mac Development Tools${NC} ====================\n"
echo "\n${GREEN}~ ${NC}Installing Mac Development Tools...\n"
xcode-select --install

# Install ZSH // Oh-My-ZSH
echo "\n${NC}==================== ${GREEN}Oh My ZSH${NC} ====================\n"
echo "\n${GREEN}~ ${NC}Installing Oh my ZSH...\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH Theme
echo "\n${GREEN}~ ${NC}Installing ZSH Theme...\n"
git clone https://github.com/caiogondim/bullet-train.zsh.git ~/Downloads/bullet-train
cp ~/Downloads/bullet-train/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes
rm -rf ~/Downloads/bullet-train

# Download ZSH Config file
echo "\n${GREEN}~ ${NC}Downloading ZSH Config...\n"
git clone https://gist.github.com/c227b6b00817eecd79523aa639ade6fc.git ~/Downloads/zsh-config
cp ~/Downloads/zsh-config/.zshrc ~/
rm -rf ~/Downloads/zsh-config
source ~/.zshrc

# Installing Powerline fonts
echo "\n${GREEN}~ ${NC}Installing Powerline Fonts...\n"
git clone https://github.com/powerline/fonts.git ~/Downloads/powerline
sh ~/Downloads/powerline/install.sh
rm -rf ~/Downloads/powerline

# Install Git
echo "\n${NC}==================== ${GREEN}GIT${NC} ====================\n"
echo "\n${GREEN}~ ${NC}Installing Git...\n"
brew install git

# Setup Git global variables
echo
echo "Introduce your name for Git: "
read GITNAME

echo
echo "Introduce your Github's email: "
read GITEMAIL

git config --global user.name $GITNAME
git config --global user.email $GITEMAIL

# Generate SSH-KEY
echo
ssh-keygen -t rsa -C $GITEMAIL

# Add Key to SSH-AGENT
eval "$(ssh-agent -s)"
ssh-add -k ~/.ssh/id_rsa

# Install OpenSSH
if ! [ -x "$(command -v openssh)" ]; then
    echo "\n${NC}==================== ${GREEN}OpenSSH${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing OpenSSH...\n"
    brew install openssh
fi

# Install Vim
if ! [ -x "$(command -v vim)" ]; then
    echo "\n${NC}==================== ${GREEN}Vim${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Vim...\n"
    brew install vim
fi

# Install vim awesome
echo "\n${GREEN}~ ${NC}Installing Vim Awesome...\n"
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

## WEB DEVELOPMENT
# //////////////////////////////////////////////////////////////////////////////// #
echo "\n${GREEN}Starting Web Development Installation...\n"

# Install Postgres
if ! [ -x "$(command -v postgres)" ]; then
    echo "\n${NC}==================== ${GREEN}Postgres${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing postgres...\n"
    brew install postgres
fi

# Install MySql
if ! [ -x "$(command -v mysql)" ]; then
    echo "\n${NC}==================== ${GREEN}MySql${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing mySql...\n"
    brew install mysql
fi

# Install SQLite
if ! [ -x "$(command -v sqlite)" ]; then
    echo "\n${NC}==================== ${GREEN}SQlite${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing SqLite...\n"
    brew install sqlite
fi

# Install MongoDB
if ! [ -x "$(command -v mongo)" ]; then
    echo "\n${NC}==================== ${GREEN}MongoDB${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing MongoDB...\n"
    brew tap mongodb/brew
    brew install mongodb-community
fi

# Install Python
if ! [ -x "$(command -v python3)" ]; then
    echo "\n${NC}==================== ${GREEN}Python${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing MongoDB...\n"
    brew install python
fi

# Install Python tools
if ! [ -x "$(command -v pip3)" ]; then
    echo "\n${NC}==================== ${GREEN}Python Tools${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Pip...\n"
    pip3 install --upgrade setuptools
    pip3 install --upgrade pip3
fi

# Install Ruby
echo "\n${NC}==================== ${GREEN}Ruby${NC} ====================\n"
echo "\n${GREEN}~ ${NC}Installing Ruby...\n"
brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
gem update --system

# Install NodeJs
echo "\n${NC}==================== ${GREEN}NodeJS${NC} ====================\n"
echo "\n${GREEN}~ ${NC}Installing NodeJs...\n"
brew install node

# Node packages for Web Development
echo "\n${NC}==================== ${GREEN}NPM Packages Installations${NC} ====================\n"
npm install -g np # A better npm publish.
npm install -g ndb # Improved debugger for Node.js via Chrome DevTools.
npm install -g now # Simple deployment.
npm install -g vtop # Visual command-line replacement for top.
npm install -g create-react-app # Standard React app builder.
nvm create-react-native-app # Standard React Native app builder.
npm install -g eslint # A fully pluggable tool for identifying and reporting on patterns in JavaScript.
npm install -g prettier # An opinionated code formatter.
npm install -g gulp # Automate and enhance your workflow.
npm install -g node-sass # Sass for CSS
npm install -g express # Node framework for Server-side.
npm install -g @angular/cli # AngularJS
npm install -g @vue/cli # VUEJS
npm install -g firebase-tools # Firebase cli access
npm install -g nodemon # Simple monitor script for use during development of a node.js app.

# Install Heroku
if ! [ -x "$(command -v heroku)" ]; then
    echo "\n${NC}==================== ${GREEN}Heroku${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Heroku...\n"
    brew tap heroku/brew && brew install heroku
fi

# Install Vagrant
if ! [ -x "$(command -v vagrant)" ]; then
    echo "\n${NC}==================== ${GREEN}Vagrant${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Vagrant...\n"
    brew cask install vagrant
    brew cask install vagrant-manager
fi

# Install Yarn Bundle Manager
if ! [ -x "$(command -v yarn)" ]; then
    echo "\n${NC}==================== ${GREEN}Yarn${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Yarn...\n"
    brew install yarn
fi

## Mobile Development
# //////////////////////////////////////////////////////////////////////////////// #
echo "\n${GREEN}Starting Mobile Development Installation...\n"

# Install IOS CocoaPods
if ! [ -x "$(command -v pod)" ]; then
    echo "\n${NC}==================== ${GREEN}IOS Cocoapods${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Cocoapods...\n"
    brew install cocoapods
fi

# Install Android Gradle
if ! [ -x "$(command -v gradle)" ]; then
    echo "\n${NC}==================== ${GREEN}Android Gradle${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Gradle...\n"
    brew install gradle
fi

# Install Java
if ! [ -x "$(command -v java)" ]; then
    echo "\n${NC}==================== ${GREEN}Java${NC} ====================\n"
    echo "\n${GREEN}~ ${NC}Installing Java...\n"
    brew cask install homebrew/cask-versions/java
fi

## Development Apps
# //////////////////////////////////////////////////////////////////////////////// #
echo "\n${GREEN}==> ${NC}Installing Development Apps...\n"

# Install Auto-Update for Cask
echo "${BLUE}==> ${NC}Installing Auto-Update...\n"
brew tap buo/cask-upgrade

# General Development Apps
echo "\n${GREEN}==> ${NC}Installing Web Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Docker Desktop...\n"
brew cask install docker
echo "\n${BLUE}==> ${NC}Installing Github Desktop...\n"
brew cask install github
echo "\n${BLUE}==> ${NC}Installing iTerm2 Terminal...\n"
brew cask install iterm2
echo "\n${BLUE}==> ${NC}Installing Vagrant...\n"
brew cask install vagrant
echo "\n${BLUE}==> ${NC}Installing Vagrant Manager...\n"
brew cask install vagrant-manager
echo "\n${BLUE}==> ${NC}Installing Virtual Box...\n"
brew cask install virtualbox

# Android Development
echo "\n${GREEN}==> ${NC}Installing Android Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Genymotion...\n"
brew cask install genymotion

# Web Development
echo "\n${GREEN}==> ${NC}Installing Web Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Local by Flywheel...\n"
brew cask install "local"
echo "\n${BLUE}==> ${NC}Installing Mamp server...\n"
brew cask install mamp

# Java Development
echo "\n${GREEN}==> ${NC}Installing Java Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Apache Netbeans...\n"
brew cask install netbeans

# Database
echo "\n${GREEN}==> ${NC}Installing Database Apps...\n"
echo "${BLUE}==> ${NC}Installing MongoDB Compass...\n"
brew cask install mongodb-compass-community
echo "\n${BLUE}==> ${NC}Installing Postgres...\n"
brew cask install postgres
echo "\n${BLUE}==> ${NC}Installing PSequel...\n"
brew cask install psequel
echo "\n${BLUE}==> ${NC}Installing Sequel Pro...\n"
brew cask install sequel-pro

# IDEs
echo "\n${GREEN}==> ${NC}Installing Intergrated Development Environment (IDE)...\n"
echo "${BLUE}==> ${NC}Installing Java Eclipse...\n"
brew cask install eclipse-ide
echo "\n${BLUE}==> ${NC}Installing Jetbrains Toolbox...\n"
brew cask install jetbrains-toolbox
echo "\n${BLUE}==> ${NC}Installing Unity HUB...\n"
brew cask install unity-hub
echo "\n${BLUE}==> ${NC}Installing Visual Studio Code...\n"
brew cask install visual-studio-code

# Browsers
echo "\n${GREEN}==> ${NC}Installing Browsers...\n"
echo "${BLUE}==> ${NC}Installing Brave Browser...\n"
brew cask install brave-browser
echo "\n${BLUE}==> ${NC}Installing Mozilla Firefox...\n"
brew cask install firefox
echo "\n${BLUE}==> ${NC}Installing Mozilla Firefox Developer Edition...\n"
brew cask install homebrew/cask-versions/firefox-developer-edition
echo "\n${BLUE}==> ${NC}Installing Google Chrome...\n"
brew cask install google-chrome

# Social Networking Apps
echo "\n${GREEN}==> ${NC}Installing Social Networking Apps...\n"
echo "${BLUE}==> ${NC}Installing Discord...\n"
brew cask install discord
echo "\n${BLUE}==> ${NC}Installing Skype...\n"
brew cask install skype
echo "\n${BLUE}==> ${NC}Installing Slack...\n"
brew cask install slack

# Utility Apps
echo "\n${GREEN}==> ${NC}Installing Utility Apps...\n"
echo "${BLUE}==> ${NC}Installing Alfred 4...\n"
brew cask install alfred
echo "\n${BLUE}==> ${NC}Installing CCleaner...\n"
brew cask install ccleaner
echo "\n${BLUE}==> ${NC}Installing Dropbox...\n"
brew cask install dropbox
echo "\n${BLUE}==> ${NC}Installing Evernote...\n"
brew cask install evernote
echo "\n${BLUE}==> ${NC}Installing ImageOptim...\n"
brew cask install imageoptim
echo "\n${BLUE}==> ${NC}Installing Keka...\n"
brew cask install keka
echo "\n${BLUE}==> ${NC}Installing Malwarebytes...\n"
brew cask install malwarebytes
echo "\n${BLUE}==> ${NC}Installing Onyx...\n"
brew cask install onyx

# Set for Auto-Update with Brew Update
echo "\n${GREEN}==> ${NC}Setting Apps for Auto-Update when using brew update...\n"
brew cu -a

## FINISH
echo
echo "\n${GREEN}Installation Finished...\n"
echo "Press any button to close..."
read
clear