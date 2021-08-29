# Title : Development Environment Installer
# Script install everything needed to work with Web and Mobile Development for Mac
# Github: https://github.com/joannerpena
# Version: v2.0.0
# Date: 08/09/2021
# Written by: Joanner Pena

import subprocess

from utils.Header import Header
from scripts.general import general_purpose
from scripts.web import web_development
from scripts.mobile import mobile_development

subprocess.call("clear", shell = True)

Header.BOLD_Tx('Welcome to Mac Development Environment Installer Script by Joannerpena')

# general_purpose()
# web_development()
mobile_development()
