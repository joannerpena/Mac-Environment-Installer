import sys
sys.path.append('../utils')

import subprocess
from utils.Header import Header
from utils.Utilities import *

def mobile_development():
    # Mobile Development
    # //////////////////////////////////////////////////////////////////////////////// #
    Header.emptyLine()
    Header.BOLD_HEADER('MOBILE DEVELOPMENT')
    
    Header.emptyLine()
    Header.BOLD_Tx_ARROW_GREEN('Starting Mobile Development Installation...')
    
    # Install IOS CocoaPods
    installPackage('pod')
    
    # Install Android Gradle
    installPackage('gradle')
    
    # Install Java
    installCaskPackage('oracle-jdk', 'Java')