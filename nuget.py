import requests
import json
import sys

#enter credentials
username = "admin"
password = "password"
artifactory = "http://127.0.0.1:8081/artifactory/api/storage/nuget-local/jquery.1.1.nupkg?properties=nuget.title,nuget.version"

r = requests.get(artifactory, auth = (username, password))
json_data = json.loads(r.text)
print json.dumps(json_data["properties"]["nuget.title"])