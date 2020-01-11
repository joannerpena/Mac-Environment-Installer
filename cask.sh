#!/bin/sh
#
#
#
clear

RED="\033[0;31m"
NC="\033[0m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"

## Development Apps
# //////////////////////////////////////////////////////////////////////////////// #
echo "\n${GREEN}==> ${NC}Development Apps...\n"

# Install Auto-Update for Cask
echo "${BLUE}==> ${NC}Installing Auto-Update...\n"
brew tap buo/cask-upgrade

# General Development Apps
echo "\n${GREEN}==> ${NC}Web Development Apps...\n"
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
echo "\n${GREEN}==> ${NC}Android Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Genymotion...\n"
brew cask install genymotion

# Web Development
echo "\n${GREEN}==> ${NC}Web Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Local by Flywheel...\n"
brew cask install "local"
echo "\n${BLUE}==> ${NC}Installing Mamp server...\n"
brew cask install mamp

# Java Development
echo "\n${GREEN}==> ${NC}Java Development Apps...\n"
echo "${BLUE}==> ${NC}Installing Apache Netbeans...\n"
brew cask install netbeans

# Database
echo "\n${GREEN}==> ${NC}Database Apps...\n"
echo "${BLUE}==> ${NC}Installing MongoDB Compass...\n"
brew cask install mongodb-compass-community
echo "\n${BLUE}==> ${NC}Installing Postgres...\n"
brew cask install postgres
echo "\n${BLUE}==> ${NC}Installing PSequel...\n"
brew cask install psequel
echo "\n${BLUE}==> ${NC}Installing Sequel Pro...\n"
brew cask install sequel-pro

# IDEs
echo "\n${GREEN}==> ${NC}Intergrated Development Environment (IDE)...\n"
echo "${BLUE}==> ${NC}Installing Java Eclipse...\n"
brew cask install eclipse-ide
echo "\n${BLUE}==> ${NC}Installing Jetbrains Toolbox...\n"
brew cask install jetbrains-toolbox
echo "\n${BLUE}==> ${NC}Installing Unity HUB...\n"
brew cask install unity-hub
echo "\n${BLUE}==> ${NC}Installing Visual Studio Code...\n"
brew cask install visual-studio-code

# Browsers
echo "\n${GREEN}==> ${NC}Browsers...\n"
echo "${BLUE}==> ${NC}Installing Brave Browser...\n"
brew cask install brave-browser
echo "\n${BLUE}==> ${NC}Installing Mozilla Firefox...\n"
brew cask install firefox
echo "\n${BLUE}==> ${NC}Installing Mozilla Firefox Developer Edition...\n"
brew cask install homebrew/cask-versions/firefox-developer-edition
echo "\n${BLUE}==> ${NC}Installing Google Chrome...\n"
brew cask install google-chrome

# Social Networking Apps
echo "\n${GREEN}==> ${NC}Social Networking Apps...\n"
echo "${BLUE}==> ${NC}Installing Discord...\n"
brew cask install discord
echo "\n${BLUE}==> ${NC}Installing Skype...\n"
brew cask install skype
echo "\n${BLUE}==> ${NC}Installing Slack...\n"
brew cask install slack

# Utility Apps
echo "\n${GREEN}==> ${NC}Utility Apps...\n"
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