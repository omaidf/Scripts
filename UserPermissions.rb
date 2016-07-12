require "rubygems"
require "rest_client"
require "json"

user = ARGV[0] #first argument should be repository to parse
user_name = 'admin' #change this
password= 'password' #change this
artifactory  = "http://127.0.0.1:8081/artifactory/api/security/users/"
permissiontargets = "http://127.0.0.1:8081/artifactory/api/security/permissions" #all permission targets

first = 0

url = artifactory + user
site = RestClient::Resource.new(url, user_name, password)
response = site.get(:accept=>"application/json")
string = response.body
parsed = JSON.parse(string)
array = Array.new
#gets user details
groups = parsed["groups"].count
#finds how many groups the user is in
while first < groups
	array.push(parsed["groups"][first])
	first +=1
	#adds groups to array
end


site = RestClient::Resource.new(permissiontargets, user_name, password)
response = site.get(:accept=>"application/json")
string2 = response.body
parsed2 = JSON.parse(string)
targets = parsed2.count 

#finds all permission targets

#adds the users groups for each array
target0 = 0
array.each{|i|
while target0 < targets
	site = RestClient::Resource.new(parsed2[target0]["uri"], user_name, password)
	response = site.get(:accept=>"application/json")
	string = response.body
	parsed = JSON.parse(string)
	if parsed["principals"]["groups"][i].nil? == false
		puts parsed["principals"]["groups"][i]
	end
	target0 += 1
end


}