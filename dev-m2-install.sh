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

# Install Github CLI
BOLD_Tx_ARROW "Installing Github CLI..." $GREEN
brew install gh

# Generate SSH-KEY
echo
ssh-keygen -t ed25519 -C $GITEMAIL

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

# Install MySql
if ! [ -x "$(command -v mysql)" ]; then
    BOLD_Tx_ARROW "Installing mySql..." $BLUE
    brew install mysql
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

# Install NodeJs
BOLD_Tx_ARROW "Installing Node Version Manager..." $BLUE
brew install nvm
mkdir ~/.nvm
nvm install 14

# Install Yarn Bundle Manager
if ! [ -x "$(command -v yarn)" ]; then
    BOLD_Tx_ARROW "Installing Yarn Package Manager.." $GREEN
    brew install yarn
fi

# Install Conventional Commits
if ! [ -x "$(command -v cz)" ]; then
    BOLD_Tx_ARROW "Installing Conventional Commits..." $GREEN
    sudo npm install -g @commitlint/cli
    sudo npm install -g @commitlint/config-conventional
    echo "module.exports = { extends: ['@commitlint/config-conventional'] }" > ~/.commitlintrc.js

    sudo npm install -g commitizen
    sudo npm install -g cz-conventional-changelog
    echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
fi

BOLD_HEADER "DevOps"
BOLD_Tx_ARROW "Starting DevOps Installation..." $GREEN

# Install Heroku
if ! [ -x "$(command -v heroku)" ]; then
    BOLD_Tx_ARROW "Installing Heroku..." $BLUE
    brew tap heroku/brew && brew install heroku
fi

# Install DDEV
if ! [ -x "$(command -v ddev)" ]; then
    BOLD_Tx_ARROW "Installing DDEV..." $BLUE
    brew install ddev/ddev/ddev
    brew upgrade ddev
    mkcert -install
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
    brew install openjdk
fi

## FINISH
echo
echo "\n${GREEN}Installation Finished...\n"
echo "Press any button to finish..."
read

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
BOLD_Tx_ARROW "Downloading Powerline Fonts..." $BLUE
git clone https://github.com/powerline/fonts.git ~/Downloads/powerline
sh ~/Downloads/powerline/install.sh
rm -rf ~/Downloads/powerline

# Installing Powerline fonts
BOLD_Tx_ARROW "Downloading Fira Code Font..." $BLUE
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Install ZSH // Oh-My-ZSH
BOLD_HEADER "Oh My ZSH"
BOLD_Tx_ARROW "Installing Oh my ZSH..." $GREEN
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

clear