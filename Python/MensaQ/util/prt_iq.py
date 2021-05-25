# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: Group of functions to spit out random IQ results. 

Design: Create separate function based on list results for IQ ranges and print randomly. 
"""

import random

def low_iq():

    Shemp = [
        "1 to 24: Profound mental disability",
        "25 to 39: Severe mental disability",
        "40 to 54: Moderate mental disability",
        "55 to 69: Mild mental disability"
]
    print(random.choice(Shemp))

def med_iq():

    Larry = [
        "70 to 84: Borderline mental disability",
        "85 to 114: Average intelligence",
        "115 to 129: Above average",
        "130 to 144: Moderately gifted"
]
    print(random.choice(Larry))

def high_iq():

    Moe = [
        "145 to 159: Highly gifted",
        "160 to 179: Exceptionally gifted",
        "180 and up: Profoundly gifted"
]

    print(random.choice(Moe))