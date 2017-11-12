#! /usr/bin/ruby

def parse (file)
  sentences = File.read(file)
  sentences = sentences.split("\r")

  puts sentences.length
  sentences
end

def might_inclusion(sentences, punctuation)
  sentences_filtered = Array.new
  punctuation.each do |p|
    sentences_filtered += sentences.select{|s| s.downcase.include?("might#{p}")}
  end

  puts sentences_filtered.length
  sentences_filtered
end

def special_case_filter (sentences_filtered)
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("military might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("economic might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("nato might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("political might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("government might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("financial might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("diplomatic might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("industrial might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("soviet might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("u.s. might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("american might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("german might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("air might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("naval might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("manufacturing might")}


  puts sentences_filtered.length
  sentences_filtered
end

def possessive_pronoun_filter (sentences_filtered, possessive_pronouns)
  possessive_pronouns.each {|pp| sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("#{pp} might")}}

  puts sentences_filtered.length
  sentences_filtered
end

def phrasal_filter(sentences_filtered)
  sentences_filtered = sentences_filtered.select{|s| !/try as \w* might/.match(s.downcase)}

  puts sentences_filtered.length
  sentences_filtered
end

def possessives_filter(sentences_filtered)
  sentences_filtered = sentences_filtered.select{|s| !/\'s(\s\w*\s|\s)might[^\s]/.match(s.downcase)}

  puts sentences_filtered.length
  sentences_filtered
end

def parenthetical_filter (sentences_filtered)
  capture = sentences_filtered.select{|s| /might,[\w\s]*\./.match(s.downcase)}
  sentences_filtered = sentences_filtered - capture
  sentences_filtered = sentences_filtered.select{|s| !/might,[\w\s]*,/.match(s.downcase)}
  sentences_filtered = sentences_filtered + capture

  puts sentences_filtered.length
  sentences_filtered
end

def adjectival_filter(sentences_filtered)
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("full might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("increasing might")}
  sentences_filtered = sentences_filtered.select{|s| !s.downcase.include?("rising might")}

  puts sentences_filtered.length
  sentences_filtered
end

file = "VP-Ellipsis-Examples-Thousands copy.txt"
punctuation = [",", ".", "?", "!", ";", ":"]
possessive_pronouns = ["my", "your", "his", "her", "its", "our", "their", "one's"]

sentences = parse(file)
sentences_filtered = might_inclusion(sentences, punctuation)
sentences_filtered = special_case_filter(sentences_filtered)
sentences_filtered = possessive_pronoun_filter(sentences_filtered, possessive_pronouns)
sentences_filtered = phrasal_filter(sentences_filtered)
sentences_filtered = possessives_filter(sentences_filtered)
sentences_filtered = parenthetical_filter(sentences_filtered)
sentences_filtered = adjectival_filter(sentences_filtered)

output = sentences_filtered.join("\n\n")

File.write('might.txt',output)
