#! /usr/bin/ruby
require 'set'
def parse (file)
  sentences = File.read(file)
  sentences = sentences.split("\n\n")

  puts sentences.length
  sentences
end
