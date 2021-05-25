# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: A simple method to print ASCII art file as the loading screen for the mensaq game. 

Design: Create a function to print ASCII art. 
"""

import os
import platform

if platform.uname().system == "Windows":
    os.system('cls')
        
else:
    os.system('clear')

def prt_ascii():
    """
    Prints the ASCII art for the word MENSA.
    """
    print('')
    print("\033[1;33;40m \n") # Set text color to Yellow.
    print('        ___           ___           ___           ___           ___      ')
    print('       /\__\         /\  \         /\__\         /\  \         /\  \     ')
    print('      /::|  |       /::\  \       /::|  |       /::\  \       /::\  \    ')
    print('     /:|:|  |      /:/\:\  \     /:|:|  |      /:/\ \  \     /:/\:\  \   ')
    print('    /:/|:|__|__   /::\~\:\  \   /:/|:|  |__   _\:\~\ \  \   /::\~\:\  \  ')
    print('   /:/ |::::\__\ /:/\:\ \:\__\ /:/ |:| /\__\ /\ \:\ \ \__\ /:/\:\ \:\__\ ')
    print('   \/__/~~/:/  / \:\~\:\ \/__/ \/__|:|/:/  / \:\ \:\ \/__/ \/__\:\/:/  / ')
    print('         /:/  /   \:\ \:\__\       |:/:/  /   \:\ \:\__\        \::/  /  ')
    print('        /:/  /     \:\ \/__/       |::/  /     \:\/:/  /        /:/  /   ')
    print('       /:/  /       \:\__\         /:/  /       \::/  /        /:/  /    ')
    print('       \/__/         \/__/         \/__/         \/__/         \/__/     ')
    print('')
    print("\033[0;37;40m \n", flush=True) # Set text color back to white.

if __name__ == '__main__':
    prt_ascii()
