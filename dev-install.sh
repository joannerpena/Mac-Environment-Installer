#!/bin/sh
#
#### Title : Development Environment Installer
#### Script install everything needed to work with Web and Mobile Development for Mac
#### Github: joannerpena
#### Version: v1.0.0
#### Date: 12/23/2019
#### Written by: Joanner Pena
#
clear

RED="\033[0;31m"
NC="\033[0m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

# BOLD_Tx_ARROW "text" // Only bold text.
BOLD_Tx (){
    echo "${BOLD} $1 ${NORMAL}"
}

# BOLD_Tx_ARROW "text" $color // Colored arrow (==>) with text.
BOLD_Tx_ARROW (){
    echo "\n$2==> ${NC}${BOLD}$1${NORMAL}\n"
}

# BOLD_HEADER "text" // Header text.
BOLD_HEADER (){
    echo "${NC}==================== ${GREEN}${BOLD}$1${NORMAL}${NC} ====================\n"
}

BOLD_Tx "Welcome to Mac Development Environment Installer Script by Joannerpena\n"

## GENERAL PURPOSE // MUST-HAVE
# //////////////////////////////////////////////////////////////////////////////// #
BOLD_Tx_ARROW "Starting Installation..." $GREEN
BOLD_HEADER "GENERAL PURPOSE INSTALLATION"

# Install Homebrew
BOLD_Tx_ARROW "Homebrew" $GREEN
if ! [ -x "$(command -v brew)" ]; then
    BOLD_Tx_ARROW "Installing homebrew..." $BLUE
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update repository
BOLD_Tx_ARROW "Updating homebrew repository..." $BLUE
brew update

# Check if it's working
BOLD_Tx_ARROW "Check if homebrew is installed correctly..." $BLUE
brew doctor

echo "Press any button to continue..."
read

# Install Mac Development Tools
BOLD_HEADER "Mac Development Tools"
BOLD_Tx_ARROW "Installing Mac Development Tools..." $GREEN
xcode-select --install

# Install ZSH // Oh-My-ZSH
BOLD_HEADER "Oh My ZSH"
BOLD_Tx_ARROW "Installing Oh my ZSH..." $GREEN
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH Theme
BOLD_Tx_ARROW "Installing ZSH Theme..." $BLUE
git clone https://github.com/caiogondim/bullet-train.zsh.git ~/Downloads/bullet-train
cp ~/Downloads/bullet-train/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes
rm -rf ~/Downloads/bullet-train

# Download ZSH Config file
BOLD_Tx_ARROW "Downloading ZSH Config..." $BLUE
git clone https://gist.github.com/c227b6b00817eecd79523aa639ade6fc.git ~/Downloads/zsh-config
cp ~/Downloads/zsh-config/.zshrc ~/
rm -rf ~/Downloads/zsh-config
source ~/.zshrc

# Installing Powerline fonts
BOLD_Tx_ARROW "Downloading ZSH Config..." $BLUE
git clone https://github.com/powerline/fonts.git ~/Downloads/powerline
sh ~/Downloads/powerline/install.sh
rm -rf ~/Downloads/powerline

# Install Git
BOLD_Tx_ARROW "Installing Git..." $GREEN
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
    BOLD_Tx_ARROW "Installing OpenSSH..." $BLUE
    brew install openssh
fi

# Install Vim
if ! [ -x "$(command -v vim)" ]; then
    BOLD_Tx_ARROW "Installing Vim..." $GREEN
    brew install vim
fi

# Install vim awesome
BOLD_Tx_ARROW "Installing Vim Awesome..." $BLUE
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

## WEB DEVELOPMENT
# //////////////////////////////////////////////////////////////////////////////// #
BOLD_HEADER "WEB DEVELOPMENT"
BOLD_Tx_ARROW "Starting Web Development Installation..." $GREEN
BOLD_Tx_ARROW "Installing Databases..." $GREEN

# Install Postgres
if ! [ -x "$(command -v postgres)" ]; then
    BOLD_Tx_ARROW "Installing postgres..." $BLUE
    brew install postgres
fi

# Install MySql
if ! [ -x "$(command -v mysql)" ]; then
    BOLD_Tx_ARROW "Installing mySql..." $BLUE
    brew install mysql
fi

# Install SQLite
if ! [ -x "$(command -v sqlite)" ]; then
    BOLD_Tx_ARROW "Installing SqLite..." $BLUE
    brew install sqlite
fi

# Install MongoDB
if ! [ -x "$(command -v mongo)" ]; then
    BOLD_Tx_ARROW "Installing MongoDB..." $BLUE
    brew tap mongodb/brew
    brew install mongodb-community
fi

BOLD_Tx_ARROW "Starting Web Development Languages installation..." $GREEN

# Install Python
if ! [ -x "$(command -v python3)" ]; then
    BOLD_Tx_ARROW "Installing Python..." $BLUE
    brew install python
fi

# Install Python tools
if ! [ -x "$(command -v pip3)" ]; then
    BOLD_Tx_ARROW "Installing Pip..." $BLUE
    pip3 install --upgrade setuptools
    pip3 install --upgrade pip3
fi

# Install Ruby
BOLD_Tx_ARROW "Installing Ruby..." $BLUE
brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
gem update --system

# Install NodeJs
BOLD_Tx_ARROW "Installing NodeJs..." $BLUE
brew install node

# Node packages for Web Development
BOLD_HEADER "NPM Packages Installations"
BOLD_Tx_ARROW "Installing NPM Packages..." $GREEN

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

BOLD_HEADER "DevOps"
BOLD_Tx_ARROW "Starting DevOps Installation..." $GREEN

# Install Heroku
if ! [ -x "$(command -v heroku)" ]; then
    BOLD_Tx_ARROW "Installing Heroku..." $BLUE
    brew tap heroku/brew && brew install heroku
fi

# Install Vagrant
if ! [ -x "$(command -v vagrant)" ]; then
    BOLD_Tx_ARROW "Installing Vagrant..." $BLUE
    brew cask install vagrant
    brew cask install vagrant-manager
fi

# Install Yarn Bundle Manager
if ! [ -x "$(command -v yarn)" ]; then
    BOLD_Tx_ARROW "Installing Yarn..." $GREEN
    brew install yarn
fi

## Mobile Development
# //////////////////////////////////////////////////////////////////////////////// #
BOLD_HEADER "MOBILE DEVELOPMENT"
BOLD_Tx_ARROW "Starting Mobile Development Installation..." $GREEN


# Install IOS CocoaPods
if ! [ -x "$(command -v pod)" ]; then
    BOLD_Tx_ARROW "Starting IOS Development Environment installation..." $GREEN
    BOLD_Tx_ARROW "Installing Cocoapods..." $BLUE
    brew install cocoapods
fi

# Install Android Gradle
if ! [ -x "$(command -v gradle)" ]; then
    BOLD_Tx_ARROW "Starting Androind Development Enviroment Installation..." $GREEN
    BOLD_Tx_ARROW "Installing Gradle..." $BLUE
    brew install gradle
fi

# Install Java
if ! [ -x "$(command -v java)" ]; then
    BOLD_Tx_ARROW "Installing Java..." $BLUE
    brew cask install homebrew/cask-versions/java
fi

## Development Apps
# //////////////////////////////////////////////////////////////////////////////// #
BOLD_HEADER "Development Apps"

# Install Auto-Update for Cask
BOLD_Tx_ARROW "Installing Auto-Update..." $GREEN
brew tap buo/cask-upgrade

# General Development Apps
BOLD_Tx_ARROW "Starting installation of Web Development Apps" $GREEN
BOLD_Tx_ARROW "Installing Docker Desktop..." $BLUE
brew cask install docker

BOLD_Tx_ARROW "Installing Transmit FTP..." $BLUE
brew cask install transmit

BOLD_Tx_ARROW "Installing Github Desktop..." $BLUE
brew cask install github

BOLD_Tx_ARROW "Installing iTerm2 Terminal..." $BLUE
brew cask install iterm2

BOLD_Tx_ARROW "Installing Vagrant..." $BLUE
brew cask install vagrant

BOLD_Tx_ARROW "Installing Vagrant Manager..." $BLUE
brew cask install vagrant-manager

BOLD_Tx_ARROW "Installing Virtual Box..." $BLUE
brew cask install virtualbox

# Android Development
BOLD_Tx_ARROW "Starting installation of Android Development Apps" $GREEN
BOLD_Tx_ARROW "Installing Genymotion..." $BLUE
brew cask install genymotion

BOLD_Tx_ARROW "Installing Vysor..." $BLUE
brew cask install vysor

# Web Development
BOLD_Tx_ARROW "Starting installation of Web Development Apps" $GREEN
BOLD_Tx_ARROW "Installing Local by Flywheel..." $BLUE
brew cask install "local"

BOLD_Tx_ARROW "Installing Mamp server..." $BLUE
brew cask install mamp

# Database
BOLD_Tx_ARROW "Starting installation of Database Apps" $GREEN
BOLD_Tx_ARROW "Installing MongoDB Compass..." $BLUE
brew cask install mongodb-compass-community

BOLD_Tx_ARROW "Installing Postgres..." $BLUE
brew cask install postgres

BOLD_Tx_ARROW "Installing PSequel..." $BLUE
brew cask install psequel

BOLD_Tx_ARROW "Installing Sequel Pro..." $BLUE
brew cask install sequel-pro

# IDEs
BOLD_Tx_ARROW "Intergrated Development Environment (IDE)" $GREEN
BOLD_Tx_ARROW "Installing Java Eclipse..." $BLUE
brew cask install eclipse-ide

BOLD_Tx_ARROW "Installing Apache Netbeans..." $BLUE
brew cask install netbeans

BOLD_Tx_ARROW "Installing Jetbrains Toolbox..." $BLUE
brew cask install jetbrains-toolbox

BOLD_Tx_ARROW "Installing Unity HUB..." $BLUE
brew cask install unity-hub

BOLD_Tx_ARROW "Installing Visual Studio Code..." $BLUE
brew cask install visual-studio-code

# Browsers
BOLD_Tx_ARROW "Starting installation of Browser Apps" $GREEN
BOLD_Tx_ARROW "Installing Google Chrome..." $BLUE
brew cask install google-chrome

BOLD_Tx_ARROW "Installing Brave Browser..." $BLUE
brew cask install brave-browser

BOLD_Tx_ARROW "Installing Mozilla Firefox..." $BLUE
brew cask install firefox

BOLD_Tx_ARROW "Installing Mozilla Firefox Developer Edition..." $BLUE
brew cask install homebrew/cask-versions/firefox-developer-edition

# Social Networking Apps
BOLD_Tx_ARROW "Starting installation of Social Networking Apps" $GREEN
BOLD_Tx_ARROW "Installing Discord..." $BLUE
brew cask install discord

BOLD_Tx_ARROW "Installing Skype..." $BLUE
brew cask install skype

BOLD_Tx_ARROW "Installing Slack..." $BLUE
brew cask install slack

# Utility Apps
BOLD_Tx_ARROW "Starting installation of Utility Apps" $GREEN
BOLD_Tx_ARROW "Installing Alfred 4..." $BLUE
brew cask install alfred

BOLD_Tx_ARROW "Installing CCleaner..." $BLUE
brew cask install ccleaner

BOLD_Tx_ARROW "Installing Dropbox..." $BLUE
brew cask install dropbox

BOLD_Tx_ARROW "Installing Evernote..." $BLUE
brew cask install evernote

BOLD_Tx_ARROW "Installing ImageOptim..." $BLUE
brew cask install imageoptim

BOLD_Tx_ARROW "Installing Keka..." $BLUE
brew cask install keka

BOLD_Tx_ARROW "Installing Malwarebytes..." $BLUE
brew cask install malwarebytes

BOLD_Tx_ARROW "Installing Spotify..." $BLUE
brew cask install spotify

BOLD_Tx_ARROW "Installing Onyx..." $BLUE
brew cask install onyx

# Set for Auto-Update with Brew Update
BOLD_Tx_ARROW "Setting Apps for Auto-Update when using brew update..." $GREEN
brew cu -a

## FINISH
echo
echo "\n${GREEN}Installation Finished...\n"
echo "Press any button to close..."
read
clear