
require 'rubygems'
require 'nokogiri'   
require 'open-uri'


#this script will open the 200.txt file, and scrape the XSS payloads into a 'payloads' file
file='200.txt'
f = File.open(file, "r")
f.each_line { |line|
    line2 = URI.encode(line)
  page_url = line2
  page = Nokogiri::HTML(open(page_url))
 File.open('payloads', 'a+') { |f|
  f.puts page.css('a')[11].text
}
}
f.close






