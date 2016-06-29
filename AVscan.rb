require 'uirusu'
require "rubygems"
require "rest_client"
require "json"
API_KEY = "85f2b9a41355bc354bde2894e0e27205e3e50e51a8da7cf4724813c996d23326"
#get your own API Key at https://www.virustotal.com/en/documentation/public-api/
file = ARGV[0] #first argument should be file to scan
user_name = 'admin'
password= 'password'
artifactory  = "http://127.0.0.1:8081/artifactory/api/storage/"
url = artifactory + file
site = RestClient::Resource.new(url, user_name, password)
response = site.get(:accept=>"application/json")
string = response.body
parsed = JSON.parse(string)
parsed.map
hash = parsed["checksums"]["md5"] #gets MD5 from artifact
results = Uirusu::VTFile.query_report(API_KEY, hash) #checks artifact's MD5 with VirusTotal database
result = Uirusu::VTResult.new(hash, results)

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