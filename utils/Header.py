# Color scheme import
from utils.Color import color

class Header:
    @staticmethod
    def BOLD_Tx(stringTx):
        print(color.BOLD + stringTx + color.END)

    @staticmethod
    def BOLD_Tx_GREEN(stringTx):
        print(color.BOLD + color.GREEN + stringTx + color.END)

    @staticmethod
    def BOLD_Tx_RED(stringTx):
        print(color.BOLD + color.RED + stringTx + color.END)

    @staticmethod
    def BOLD_Tx_ARROW(stringTx):
        print(color.BOLD + '==> ' + stringTx + color.END)

    @staticmethod
    def BOLD_Tx_ARROW_GREEN(stringTx):
        print(color.BOLD + color.GREEN + '==> ' + stringTx + color.END)

    @staticmethod
    def BOLD_Tx_ARROW_BLUE(stringTx):
        print(color.BOLD + color.BLUE + '==> ' + stringTx + color.END)

    @staticmethod
    def BOLD_HEADER(stringTx):
        print(color.GREEN + color.BOLD + '==================== ' + stringTx + ' ====================' + color.END)

    @staticmethod
    def emptyLine():
        print('')