#!/usr/bin/python
import re
import sys
from geoip import geolite2

ips = sys.argv[1]
#readfile = sys.argv[1]
with open(ips, "r") as ins:
	array = []
	for line in ins:
		array.append(line)
		array2 = [elem.strip().strip('\n') for elem in array] #strips new lines
		#print array

for ip in array2:
   	try:
   		match = geolite2.lookup(ip)
   		print ip + " - " + match.country #prints country of each IP address
   	except Exception:
   		pass

    	
