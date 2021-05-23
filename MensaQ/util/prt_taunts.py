# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: Group of functions to spit out random funny taunts when user guesses the wrong answer. 

Design: Create separate functions based on list results for funny taunts to print randomly. 
"""

import random

def yell():

    taunt = [
            'Maybe you need to register for a math class.', 
            'Need more fingers to count on?', 
            'I forsee a calculator in your future.',
            'I wonder if you will ever figure this out.',
            'You throw like my Mom.',
            "This ain't rocket science, sheesh.",
            'I guess 7 is not a lucky number for you.',
            '7...17..., there are 2 for free.',
            "Don't give up just yet.",
            'Chance favors the prepared mind.',
            'Nope, I guessed that one too.',
]
    print(random.choice(taunt))

def taunt1():

    taunt1 = [
            'Gosh, no need to exaggerate.',
            'Liar, liar, pants on fire.',
            'No, that is not quite it.',
            'Pffffsstt, yeah right.',
            'Yeah, nice try.',
            "Well, we're waiting....",
            "Wang, it's a parking lot let's go!",
            "OMG, you don't have a clue.",
            "Take a second to rethink your life.",
            "If you are a CPA you chose the wrong career path.",
            "I think we need medical assistance over here.",
]  
    print(random.choice(taunt1))







    # print('\x1b[6;30;42m' + 'Success!' + '\x1b[0m')