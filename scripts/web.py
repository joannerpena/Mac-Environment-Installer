import sys
sys.path.append('../utils')

import subprocess
from utils.Header import Header
from utils.Utilities import *

def web_development():
    # Web Development
    # //////////////////////////////////////////////////////////////////////////////// #
    Header.emptyLine()
    Header.BOLD_HEADER('WEB DEVELOPMENT')
    
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_GREEN('Starting Web Development Installation...')
    
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_GREEN('Installing Databases...')
    
    # Install Postgres
    installPackage('postgres')
    
    # Install MySql
    installPackage('mysql')
    
    #Install SQLite
    installPackage('sqlite')
    
    # Install MongoDB
    installPackage('mongo')
    
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_GREEN('Starting Web Development Languages installation...')
    
    # Install Python
    installPackage('python3')
    
    # Install Python Tools
    installPackage('pip3')
    
    # Install Ruby
    subprocess.call(['brew install rbenv ruby-build rbenv-default-gems rbenv-gemset'], shell=True)
    subprocess.call(['sudo gem update --system'], shell=True)
    
    # Install NodeJS
    installPackage('node')
    
    # Install Heroku
    installPackage('heroku')
    
    # Install Vagrant
    installPackage('vagrant')
    
    # Install Yarn Bundle Manager
    installPackage('yarn')
    
    