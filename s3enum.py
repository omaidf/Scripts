import sys
import re
import socket
import requests

def noarguments():
    print('Usage: python script.py sitelist.txt')
    sys.exit(0)

if len(sys.argv) != 2:
    noarguments()

sitelist = sys.argv[1]

subdomainurl2 = ".s3.amazonaws.com"
urlpath2 = "http://s3.amazonaws.com/"

def urlpath():
    url = urlpath2 + line.rstrip() + '/'
    r = requests.get(url)
    print r.status_code
    print url

def subdomain():
    url = 'http://' + line.rstrip() + subdomainurl2
    r = requests.get(url)
    print r.status_code
    print url



with open(sitelist) as f:
        for line in f:
                urlpath()
                subdomain()


