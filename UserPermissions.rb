require "rubygems"
require "rest_client"
require "json"
require "filesize"

#user = ARGV[0] #first argument should be repository to parse
user_name = 'admin' #change this
password= 'password' #change this
artifactory  = "http://127.0.0.1:8081/artifactory/api/security/users/omar" #change this
permissiontargets = "http://127.0.0.1:8081/artifactory/api/security/permissions"

url = artifactory #+ user
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


site2 = RestClient::Resource.new(permissiontargets, user_name, password)
response2 = site2.get(:accept=>"application/json")
string2 = response2.body
parsed2 = JSON.parse(string)
parsed2.map
targets = parsed2.count 
target0 = 0
first = 0
#finds all permission targets

while target0 < targets
	site3 = RestClient::Resource.new(parsed[target0]["uri"], user_name, password)
	response3 = site3.get(:accept=>"application/json")
	string3 = response3.body
	parsed3 = JSON.parse(string)
	parsed3.map
	target0 += 1
	

end




#adds the users groups for each array

array.each{|i|

puts parsed2["principals"]["groups"][i].nil?

}