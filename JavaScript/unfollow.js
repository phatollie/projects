/* 

1. Navigate to your linkedin feed page or conenctions page.
2. Scroll down all the way until no more connections appears on screen (reach the bottom).
3. Right click on page and select inspect.
4. Find the word console and click on it.
5. Paste the below snippet into the console command line.
    a. Press the Enter/Return key
    b. Be patient...wait...
    c. Ignore the error "blank" is not a function for anon, etc....
6. Observe, the page will refresh showing all connections changed from ✓Following to +Follow
7. Close inpection window.
8. With a clean slate you can +Follow connections that hold your current/future interests. 

Note: Your connections are NOT alerted when you changed their following status and you remain connections on Linkedin. 

*/

var b = document.querySelectorAll("button.is-following"); for (i in b) { b[i].click() }

