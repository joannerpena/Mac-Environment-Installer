# MacOs Development Environment Installer Script

**DISCLAIMER:** It is recommended to use this script with a Fresh installation of your MacOs System to avoid any random errors.

This script was created with the objective of installing everything you need for a development environment in your MacOs. From installing Brew for package downloading to Installing NPM packages for local usage.

## Still under development

Even though this script is fully functional as of now, I'm still working on the stability of it. So if you get any error or you have any recommendation of what you would like to see added in this script, do not hesitate in letting me know.

## Installing script

`sh ./dev-install.sh`

## Update Cask Apps after install

`brew cu -af`

## List of Packages and Technologies added to this Script for Installation

- **Homebrew**
  - Git
  - OpenSSH
  - Vim
  - [Vim Awesome](https://github.com/amix/vimrc)
  - Java
  - Python
  - Python Tools : _pip3_
  - Ruby
  - NodeJs
  - Heroku
  - Vagrant
  - Yarn Bundle Manager
  - Cocoapods
  - Gradle
- **Mac Development Tools**
- **Oh-My-ZSH**
  - [ZSH Theme : Bullet-Train](https://github.com/caiogondim/bullet-train.zsh)
  - [Powerline Fonts](https://github.com/powerline/fonts)
- **Database**
  - MySql
  - MongoDB
- **NPM Packages**

  _I removed these Global packages from the script to avoid security concerns._

  - [np](https://www.npmjs.com/package/np) - A better npm publish.
  - [ndb](https://www.npmjs.com/package/ndb) - Improved debugger for Node.js via Chrome DevTools.
  - [now](https://www.npmjs.com/package/now) - Simple deployment.
  - [vtop](https://www.npmjs.com/package/vtop) - Visual command-line replacement for top.
  - [create-react-app](npmjs.com/package/create-react-app) - Standard React app builder.
  - [create-react-native-app](https://www.npmjs.com/package/create-react-native-app) - Standard React Native app builder.
  - [eslint](https://www.npmjs.com/package/eslint) - A fully pluggable tool for identifying and reporting on patterns in JavaScript.
  - [prettier](https://www.npmjs.com/package/prettier) - An opinionated code formatter.
  - [gulp](https://www.npmjs.com/package/gulp) - Automate and enhance your workflow.
  - [node-sass](https://www.npmjs.com/package/node-sass) - Sass for CSS
  - [express](https://www.npmjs.com/package/express) - Node framework for Server-side.
  - [angular/cli](https://www.npmjs.com/package/@angular/cli) - AngularJS
  - [vue/cli](https://www.npmjs.com/package/@vue/cli) - [VueJS](https://www.npmjs.com/package/@vue/cli)
  - [firebase-tools](https://www.npmjs.com/package/firebase-tools) - Firebase cli access
  - [nodemon](https://www.npmjs.com/package/nodemon) - Simple monitor script for use during development of a node.js app.

## List of Development Apps

### General Development Apps

- Docker
- Github
- iTerm2
- Hyper
- Virtual Box

### Web Development

- Local by Flywheel
- Devkinsta
- Postman

### Database

- MongoDB Compass
- Sequel Pro
- Tableplus

### IDEs

- Jetbrains Toolbox | _Install any Jetbrain app + Android Studios with Jetbrain Toolbox_
- Visual Studio Code

### Browsers

- Brave Browser
- Mozilla Firefox
- Mozilla Firefox Developer Edition
- Google Chrome

### Social Networking Apps

- Discord

### Utilities Apps

- Alfred 4
- CCleaner
- Dropbox
- Figma
- Evernote
- Spotify
- ImageOptim
- Keka
- Malwarebytes
- Onyx
