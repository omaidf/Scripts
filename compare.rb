require "rubygems"
require "rest_client"
require "json"


fileone = ARGV[0]
filetwo = ARGV[1]
arrayone = Array.new
arraytwo = Array.new


File.open(fileone).each_line do |line|
	arrayone.push(line)
end

File.open(filetwo).each_line do |line|
	arraytwo.push(line)
end

puts arrayone
puts arraytwo