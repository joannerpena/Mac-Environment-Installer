import sys
sys.path.append('../utils')

import subprocess
from utils.Header import Header
from utils.Utilities import *

def general_purpose():
    # GENERAL PURPOSE // MUST-HAVE
    # //////////////////////////////////////////////////////////////////////////////// #
    Header.emptyLine()
    Header.BOLD_Tx_ARROW('Starting Installation...')

    Header.emptyLine()
    Header.BOLD_HEADER('GENERAL PURPOSE INSTALLATION')

    # Install Homebrew
    installBrew()
    
    # Update repository
    updateBrew()
    
    # Check if brew is working
    checkBrew()
    
    Header.emptyLine()
    key_continue = raw_input('Press any button to continue...')
    
    # Install Mac Development Tools
    Header.emptyLine()
    Header.BOLD_HEADER('Mac Development Tools')
    
    package = does_exist('xcode-select')
    if package != 0:
        Header.emptyLine()
        Header.BOLD_Tx_ARROW_BLUE('Installing Mac Development Tools...')
        subprocess.call(['xcode-select', '--install'])
    else: 
        Header.emptyLine()
        Header.BOLD_Tx_GREEN('Mac Development Tools are installed on your machine already')
        
    # Install Git
    installPackage('git')
    
    # Setup Git Global variables
    Header.emptyLine()
    gitName = raw_input('Introduce your name for Git: ')
    gitEmail = raw_input("Introduce your Github's email: ")
    
    subprocess.call(['git', 'config', '--global', 'user.name', gitName.lower()])
    subprocess.call(['git', 'config', '--global', 'user.email', gitEmail.lower()])
    
    # Generate SSH-KEY
    Header.emptyLine()
    Header.BOLD_Tx_ARROW('SSH-Key')
    
    Header.emptyLine()
    subprocess.call(['ssh-keygen', '-t', 'ed25519', '-C', gitEmail])
    
    # Add Key to SSH-AGENT
    Header.emptyLine()
    subprocess.call(['ssh-agent', '-s'])
    subprocess.call(['ssh-add', '-k', '~/.ssh/id_rsa'])
    
    # Install OpenSSH
    installPackage('openssh')
    
    # Install Vim
    installPackage('vim')
    
    # Install Vim Awesome
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_BLUE('Installing Vim Awesome')
    subprocess.call(['git clone https://github.com/amix/vimrc.git ~/.vim_runtime'], shell=True)
    subprocess.call(['sh ~/.vim_runtime/install_awesome_vimrc.sh'], shell=True)
    