


fileone = ARGV[0]
filetwo = ARGV[1]

arrayone = Array.new
arraytwo = Array.new
with open(fileone) as f:
    for line in f:
    	arrayone.push(line)

with open(filetwo) as f:
    for line in f:
    	arraytwo.push(line)

print (arrayone==arraytwo).all()