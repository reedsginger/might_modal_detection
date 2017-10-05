sentences = File.read("VP-Ellipsis-Examples-Thousands copy.txt")
sentences = sentences.split("\r")

#sentences=sentences.map{|s| s.downcase}
#sentences_filtered = filter(lambda s: "might." in s, sentences)

sentences_filtered = sentences.select{|s| s.downcase.include?("might.")}
puts sentences_filtered.length
sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("military might.")}
puts sentences_filtered.length
sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("economic might.")}
puts sentences_filtered.length
sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("our might.")}
puts sentences_filtered.length
sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("its might.")}
puts sentences_filtered.length

file = sentences_filtered.join("\n\n")

File.write('might.txt',file)
