require "rubygems"
require "rest_client"
require "json"


username = "admin"
password = "password"
nugeturl = "http://127.0.0.1:8081/artifactory/api/storage/nuget-local?list&deep=1&listFolders=1"
site = RestClient::Resource.new(nugeturl, username, password)
response = site.get(:accept=>"application/json")
string = response.body
parsed = JSON.parse(string)
artifacts = parsed["files"].count
$i = 0
while $i < artifacts do
		artifacturl = parsed["files"][$i]["uri"]
		propertiesurl = "http://127.0.0.1:8081/artifactory/api/storage/nuget-local#{artifacturl}?properties=nuget.title,nuget.version"
		site2 = RestClient::Resource.new(propertiesurl, username, password)
		response2 = site2.get(:accept=>"application/json")
		string2 = response2.body
		parsed2 = JSON.parse(string2)
		title = parsed2["properties"]["nuget.title"]
		version = parsed2["properties"]["nuget.version"]
		puts "#{title} #{version}"
		$i +=1
end