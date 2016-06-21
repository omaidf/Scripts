#!/usr/bin/python
import re
import sys
readfile = sys.argv[1]
#parses Apache and Nginx Logs
i = 0
with open(readfile) as f:
    for line in f:
    		try:
    			regex = '^(\S+) \S+ \S+ \[([^\]]+)\] "([A-Z]+)[^"]*" \d+ \d+ "[^"]*" "([^"]*)"$'
    			match = re.search(regex,line.encode('ascii'),flags = 0)
    			print (match.group(1)) + (match.group(4))
                #+ " - " + (match.group(3))
           
    		except Exception:
    			pass

