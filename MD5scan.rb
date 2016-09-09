
require 'uirusu'
require "rubygems"
require "rest_client"
require "json"
API_KEY = "APIKEY"
#get your own API Key at https://www.virustotal.com/en/documentation/public-api/
md5 = ARGV[0] #first argument should be MD5 to check
user_name = 'admin'
password= 'password'
artifactory  = "http://127.0.0.1:8081/artifactory/api/storage/"
url = artifactory + file
results = Uirusu::VTFile.query_report(API_KEY, md5) #checks artifact's MD5 with VirusTotal database
result = Uirusu::VTResult.new(md5, results)

re = /(.*):(.)(.*)/
output = result.to_stdout
output.each_line do |line|
	lm = line.match(re)
	unless lm.nil? || lm[3] == "Nothing detected"
			avtype = lm[1] #lm[1] group is the Antivirus name
			virustype = lm[3] #lm[3] group is the AV result
			scanurl = url + "?properties=" + avtype + "=" + virustype
			site2 = RestClient::Resource.new(scanurl, user_name, password)
			response2 = site2.put(:accept=>"application/json")	
	end
end
puts "Finished!"
