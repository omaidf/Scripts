import sys
import re
import socket
import colorama
from colorama import Fore, Back, Style


linecount = 5001
countedlines = 0

def noarguments():
    print('Usage: python script.py sitelist.txt subdomainlist.txt')
    sys.exit(0)

if len(sys.argv) != 3:
    noarguments()


site = sys.argv[1]
dnslist = sys.argv[2]


def bruteforce():
    with open(dnslist) as f:
        for line in f:
            try:
                subdomain = line.rstrip() + "." + site
                print Fore.GREEN + subdomain  + " - " + socket.gethostbyname(subdomain)
            except Exception:
            	pass


bruteforce()
print(Style.RESET_ALL)
exit()