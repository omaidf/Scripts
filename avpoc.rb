require "rubygems"
require "rest-client"
require "json"

artpath = ARGV[0] #first argument should be file to scan
filepath = ARGV[1]
scanresults = `clamscan #{filepath} 2>/dev/null`

def clean()
artpath = ARGV[0] 
user_name = 'admin'
password= 'starky22'
artifactory  = "http://127.0.0.1:8081/artifactory/api/storage/"
url = artifactory + artpath
scanurl = url + "?properties=ScanResults=Clean"
site = RestClient::Resource.new(scanurl, user_name, password)
response = site.put(:accept=>"application/json")
end

def infected()
artpath = ARGV[0] 
user_name = 'admin'
password= 'starky22'
artifactory  = "http://127.0.0.1:8081/artifactory/api/storage/"
url = artifactory + artpath
scanurl = url + "?properties=ScanResults=Infected"
site2 = RestClient::Resource.new(scanurl, user_name, password)
response2 = site2.put(:accept=>"application/json")

end

if scanresults.include? 'Infected files: 1'
	infected()
else
	clean()
end