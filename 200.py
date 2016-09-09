import requests
urlnum = 150570
while 1 < 2:
	url1 = "https://www.openbugbounty.org/incidents/"
	url2 = "/"
	uri = url1 + str(urlnum) + url2
#	This script creates a file of valid URL's. If the http request returns a 200 OK code,
# the URL will be written to the 200.txt file
	r = requests.head(uri)
	if r.status_code == 200:
		target = open("200.txt", "a")
		target.write(uri)
		target.write('\n')
		target.close()
		urlnum -=1
	else:
		urlnum -=1
