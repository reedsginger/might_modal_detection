#! /usr/bin/ruby

def parse (file)
  sentences = File.read(file)
  sentences = sentences.split("\n\n")

  puts sentences.length
  sentences
end


sentences_filtered = parse('tmp.txt')


output = sentences_filtered.join("\n\n")
File.write('tmp.txt', output)
