require "net/http"
require "uri"



def whatip()
uri = URI.parse("http://whatismyip.akamai.com/")
# Shortcut
response = Net::HTTP.get_response(uri)
# Will print response.body
puts Net::HTTP.get_print(uri)
end

whatip()