require 'wordnet'
file=ARGV[0] #read file
File.readlines(file).each do |line| #for each line in text file do...
	word2define = line 
	puts word2define #prints every line in file - words
	lemmas = WordNet::Lemma.find_all(line.strip) #strips newlines
	synsets = lemmas.map { |lemma| lemma.synsets }
	definition = synsets.flatten
	puts definition #prints deinitions
end