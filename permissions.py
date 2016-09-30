import requests
import json
import sys

def noarguments():
    print('Usage: python permissions.py username')
    sys.exit(0)

if len(sys.argv) != 2:
    noarguments()

#enter credentials
username = "admin"
password = "password"
artifactory = "http://127.0.0.1:8081/artifactory/" # change this artifactory URL
securitypermissions = "api/security/permissions"
user = sys.argv[1] #first argument is name

def getpermissiontargets():
	url = artifactory + securitypermissions #find all permission targets
	r = requests.get(url, auth = (username, password))
	json_data = json.loads(r.text)
	for perm in json_data: checkpermissiontarget(perm['name'])


def checkpermissiontarget(target): #check each permission target
	permissionurl = artifactory + securitypermissions + "/" +  target
	p = requests.get(permissionurl, auth = (username, password))
	permission_data = json.loads(p.text)
	principals = permission_data["principals"]
	try:
		userperms = permission_data["principals"]["users"][user]
		print permission_data["name"] #print permission target name
		print userperms #print permissions for user
	except KeyError: pass

getpermissiontargets()