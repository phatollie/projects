# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: A simple method to print ASCII art file as the loading screen for the mensaq game. 

Design: Create a function to print ASCII art. 
"""

import os


def prt_ascii():
    """
    Prints the ASCII art for the word MENSA.
    """
    os.system('cls')
    print('')
    print("\033[1;32;40m \n") # Set text color to green.
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
    print("\033[0;37;40m \n") # Set text color back to white.

if __name__ == '__main__':
    prt_ascii()
