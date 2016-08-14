import sys
import re
import socket

if len(sys.argv) !=2:
    print('Usage: python csvparse.py sitelist.txt')
    sys.exit(0)
readfile = sys.argv[1]
with open(readfile) as f:
    for line in f:
        try:
            p = re.compile(ur'(.*),(.*)')
            match = re.match(p,line)
            print socket.gethostbyname(match.group(2))
        except Exception:
            pass

exit()
