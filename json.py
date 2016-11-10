#!/usr/bin/python
import re
import sys
import colorama


readfile = sys.argv[1]
i = 0
with open(readfile) as f:
    for line in f:
        try:
    		regex = '(\[\")(.*)(\"\])(.*)(\[\")(.*)(\"\])'
    		match = re.search(regex,line.encode('ascii'),flags = 0)
    		print (match.group(2)) + " " + (match.group(6))
    	except Exception:
    		print line
