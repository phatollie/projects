# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: LinkedIn job serach URL generator works best when used in a private/incognito browswer or when you are logged out of LinkedIn all together. This Secret URL string allows users to browse jobs in a more 'RAW' experience rather than fluffed up with bogus LinkedIn garbage (login, ads, limited frame size, limited results per page, adjusting results based on subscribed companies profiles, 'promoted'). Kind of reminds me back in the day when Monster.com got started based on the same idea providing raw search results, now look at their site with similar usability issues. This URL Gen tool is for geared towards geek engineer types, like me, who prefer clean no fuss search/results. Simple command line using Python 3. The URL generates a secret LinkedIn source and directs users to a basic yet semi-functional LinkedIn HTML site which opperates outside the "normal" login requirements wrapper. Use it while you still can!

Design: URL Gen 1.0 is a very remedial design to provide the basic building URL string from a Python command line. Note: while some values are hard coded from LinkedIn directly and may change at any moment which might invalidate this script.  
"""

import re

# various dictionaries to hold value pairs 
cities = {'San Francisco' : '102277331', 'San Jose' : '106233382', 'Santa Clara': '100075706',}
sorted = {'Most recent' : 'DD', 'Most relevant' : 'R',}
posted = {'24 hours' : '&f_TPR=r86400', 'Past week' : '&f_TPR=r604800', 'Past month' : '&f_TPR=r2592000', 'Any time' : '',}
miles = ['10', '25', '50', '75', '100',]


# Infinite loop for input validation
while True:
    city = input('[Required] Type exactly from list (San Francisco, San Jose, Santa Clara): ')
    if city in cities:
        break
    else:
        continue

# Infinite loop for input validation
while True:
    keyword = input('[Optional] Keyword Search(i.e., Software Engineer): ')
        #'+str(keyword).replace(" ", "%20")+' -- Code Reference
         
    if bool(re.match('[a-zA-Z\s]+$', keyword)) or ' ':
        break
    else:
        print("Keyword search requires text only entries.")

# Infinite loop for input validation
while True:
    sort = input('[Required] Sort results by (Most recent, Most relevant): ')
    if sort in sorted:
        break
    else:
        continue

# Infinite loop for input validation
while True:
    distance = input('[Required] Distance from city in miles(10, 25, 50, 75, 100): ')
    if distance in miles:
        break
    else:
        continue

# Infinite loop for input validation
while True:
    date = input('[Required] Date posted(24 hours, Past week, Past month, Any time): ')
    if date in posted:
        break
    else:
        continue

# Print statements to provide visual space and URL creation
print()
print(f'https://ie.linkedin.com/jobs/search?keywords='+str(keyword).replace(" ", "%20")+'&location=&geoId='+str(cities[city])+'&trk=public_jobs_jobs-search-bar_search-submit&sortBy='+str(sorted[sort])+'&position=1&pageNum=0&distance='+str(distance)+str(posted[date]))
print()


# Raw URL for reference:
    # https://ie.linkedin.com/jobs/search?keywords=Quality%20Assurance&location=San%20Jose%2C%20California%2C%20United%20States&geoId=106233382&trk=public_jobs_jobs-search-bar_search-submit&position=1&pageNum=0