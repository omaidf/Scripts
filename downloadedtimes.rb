require "rubygems"
require "rest_client"
require "json"

if ARGV.empty?
    puts "Usage: ruby downloadedtimes.rb $repositoryname"
    exit
end

repo = ARGV[0] #first argument should be repository to parse
user_name = 'admin' #change this
password= 'password' #change this
artifactory  = "http://127.0.0.1:8081/artifactory/api/storage/" #change this to your artifactory
listfolders = "?list&deep=1&listFolders=1" #File List Rest API
statfile = "?stats" #File Statistics Rest API
$i = 0
totaldownloadcount = 0 #total amount of times files in this repository have been downloaded

url = artifactory + repo + listfolders #File List URL
site = RestClient::Resource.new(url, user_name, password)
response = site.get(:accept=>"application/json")
string = response.body
parsed = JSON.parse(string)
parsed.map  
#get list of all files
artifacts = parsed["files"].count #how many files?

while $i < artifacts do #for every file, get the 'downloadCount' property
	uri = parsed["files"][$i]["uri"]
	downloadcounturl = artifactory + repo + uri + statfile #File Statistics URL
	site2 = RestClient::Resource.new(downloadcounturl, user_name, password)
	response2 = site2.get(:accept=>"application/json")
	string2 = response2.body
	parsed2 = JSON.parse(string2)
	#add all of the 'downloadCount' properties up
	totaldownloadcount += parsed2["downloadCount"]
	$i +=1
	
end
#print all of the 'downloadCount' properties
puts totaldownloadcount






