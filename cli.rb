require "rubygems"
require "rest_client"
require "json"
$user_name = 'admin'
$password= 'password'
$artifactory  = "http://127.0.0.1:8081/artifactory/"


command = ARGV[0]

if command == "asv"
	$api = "api/system/version"
else
end

def asv()
 #you can change this API URL to any API method you'd like to use
url = $artifactory + $api
site = RestClient::Resource.new(url, $user_name, $password)
response = site.get(:accept=>'application/json') #this script is ONLY for GET commands
puts response.body
end
asv()




