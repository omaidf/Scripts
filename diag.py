#!/usr/bin/python
import re
import sys
import colorama
import argparse
from colorama import Fore, Back, Style

artifactory = sys.argv[1]

i = 0
with open(artifactory + "/logs/artifactory.log") as f:
    for line in f:
    	if "INFO" in line:
    		try:
    			regex = '^([-0-9]+ [:0-9]+,[0-9]+) \[([-a-zA-Z0-9]+)\] \[([A-Z]+) *\] \(([.a-zA-Z0-9]+):([0-9]+)\) - (.*)$'
    			match = re.search(regex,line.encode('ascii'),flags = 0)
    			print Fore.GREEN + "INFO:" + (match.group(6))
           
    		except Exception:
    			pass


with open(artifactory + "/logs/request.log") as f:
    for line in f:
        try:
            p = re.compile(ur'(\d*)\|(\d*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)')
            match = re.match(p,line)
            artdate = match.group(1)[4:]
            artdate = artdate[:-2]
            a,b,c,d,e,f,g,h = artdate
            print  match.group(9)

            #group4 = IP
            #group1 = time
            #group5 = user
            #group6 = specifies the type of request(GET,POST,PUT)
            #group7 = the resource access
            #group9 = HTTP response code
        except Exception:
            pass

    	
 