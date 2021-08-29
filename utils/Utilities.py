import sys
sys.path.append('../')

import subprocess
from Header import Header

def does_exist(commandApp):
    returnCommand = subprocess.Popen(['command', '-v', commandApp], stdout=subprocess.PIPE)
    return returnCommand.wait()

def installBrew():
    package = does_exist('brew')
    
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_GREEN('Homebrew')

    if package != 0:
        Header.emptyLine()
        Header.BOLD_Tx_ARROW_BLUE('Installing Homebrew...')
        
        Header.emptyLine()
        subprocess.call(['curl', '-O', 'https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'])
        subprocess.call(['sh', 'install.sh'])
        subprocess.call(['rm', 'install.sh'])
    else: 
        Header.emptyLine()
        Header.BOLD_Tx_GREEN('brew is installed on your machine already')

def installPackage(packageName):
    package = does_exist(packageName)

    if package != 0:
        Header.emptyLine()
        Header.BOLD_Tx_ARROW_BLUE('Installing ' + packageName.capitalize() + '...')
        
        Header.emptyLine()
        subprocess.call(['brew', 'install', packageName])
    else: 
        Header.emptyLine()
        Header.BOLD_Tx_GREEN(packageName.capitalize() + ' is already installed on your machine')
        
def installCaskPackage(packageName, packageTitle):
    package = does_exist(packageName)

    if package != 0:
        Header.emptyLine()
        Header.BOLD_Tx_ARROW_BLUE('Installing ' + packageTitle + '...')
        
        Header.emptyLine()
        subprocess.call(['brew', 'install', '--cask', packageName])
    else: 
        Header.emptyLine()
        Header.BOLD_Tx_GREEN(packageTitle + ' is already installed on your machine')
        
def updateBrew():
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_BLUE('Updating homebrew repository...')
    
    Header.emptyLine()
    subprocess.call(['brew', 'update'])
    
def checkBrew():
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_BLUE('Check if homebrew is installed correctly...')
    
    Header.emptyLine()
    subprocess.call(['brew', 'doctor'])