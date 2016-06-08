import requests

url = "http://whatismyip.akamai.com/" #artifactory URL
r = requests.get(url) #this script is only for API methods that use GET
print r.content
