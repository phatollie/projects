# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: Coding challenge to take an actual Mensa question and convert it into a python number question/game. Along with providing some funny mistake responses and similar IQ results triggered by  n/number of guesses. 

Design: MensaQ has been written with OOP in mind providing a single file/location to control the game variables. 
"""

from util.lt_func import *
from util.prt_taunts import *
from util.prt_ascii import *
from util.prt_iq import *
from util.get_count import *

class MensaQ: # Game class
    """
    Defines the :class:`MensaQ` class, which provides base config for Mensa question game.
    
    :param `number` creates first argument.  
    :param `ans` set to 0 as placeholder to increment guesses.  
    :param `mn` argument placeholder for minimum number.  
    :param `mx` argument placeholder for maximum number.  
    """
    def __init__(self, number, mn, mx):
        self.number = number
        self.ans = 0
        self.min = mn
        self.max = mx
        
    def get_guess(self):
        """
        Intializes the question for user input.
        """
        guess = input(f'If you count from {get_min(self)} - {get_max(self)} how many {get_var(self)}s will you pass?: ')
        print('')        
        if self.valid_number(guess):
            return int(guess)
        else:
            
            print("Please enter only positive numbers (e.g. 1..2..3..) unless this question is too advanced.")
            
        return self.get_guess()

    def valid_number(self, str_number):
        """
        Checks for a valid number input from user.

        :param `str_number`: number object.
        """
        try:
            number = int(str_number)
        except:
            self.ans += 1
            return False

        return number >= 0

    def play(self):
        """
        Main game function with funny taunts and revealing solution output.
        """
        
        while True:
            self.ans += 1
            
            guess = self.get_guess()

            if guess < get_count():
                yell()
                continue
            
            if guess > get_count():
                taunt1()
                continue
            
            if self.ans < 3:
                print(f"You solved it! Based on {self.ans} attempt(s) your IQ is around:")
                high_iq()
                break
                
            if self.ans >= 3 and self.ans < 6:
                print(f"You solved it! Based on {self.ans} attempt(s) you're IQ is around:")
                med_iq()
                break    
            
            if self.ans > 6:
                print(f"You solved it! Based on {self.ans} attempt(s) you're IQ is around:")
                low_iq()
                break
            
            else:
                break
        
        print(f"These are the {get_count()} instantces of the number {get_var(self)} take a look =>")
                
        # loop to print out numbers containing the variable set by get_var
        for i in range(get_min(self), get_max(self)): 
            if str(get_var('')) in str(i):
                
                print(f'{i}', end = " ")
        print()
        print()
        
prt_ascii()                        
game = MensaQ(get_count(), get_min(''), get_max(''))
game.play()

