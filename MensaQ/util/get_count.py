# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: Function to gather the instances/count of a single integer in a range of numbers. 

Design: Establish an iterable list that returns a type casted integer result.
"""

from collections import Counter
from util.lt_func import *

def get_count():
    """
    An unclean get function that gets the job done.
    """    
    l = []
    for i in range(get_min(''), get_max('')):
        l.append(i)
    
    number_as_string = ''.join(map(str, l))
    
    Counter(number_as_string)[str(get_var(''))]
    
    # Following gem returns an integer result from a 0 value iterated by a literal 
    result = 0
    result = (Counter(number_as_string)[str(get_var(''))])
    return result                                           

if __name__ == '__main__':
    get_count()