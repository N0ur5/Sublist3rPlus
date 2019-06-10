try:
    import sys
    import re
    import os
    import subprocess
    from googlesearch import search
    from urllib.parse import urlparse
except ImportError:
    print("No module named 'google' found")

already_found = set()

#Google Subdomain query

for URL in search("site:"+sys.argv[1], tld="com", lang='en', num=10, start=0, stop=100, pause=2):
    testparse = urlparse(URL)
    netlock = testparse.netloc
    netlockSubdom = urlparse(netlock).path.split('.')[-0]
    newURL = str(netlockSubdom + "." + sys.argv[1])
    if netlockSubdom not in already_found:
        print("[+Google+] Subdomain Found!: " + newURL)
        already_found.add(netlockSubdom)

#Bing query
