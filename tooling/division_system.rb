#! /usr/bin/ruby

def parse (file, parse_char)
  sentences = File.read(file)
  sentences = sentences.split(parse_char)

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

def divide(sentences_filtered)
  modal = Array.new
  not_modal = Array.new
  i = 0
  sentences_filtered.each do |s|
    puts s
    des = gets
    des = des.chomp

    if des == 'y'
      File.open("modal.txt","a+"){|f| f << s + "\n\n"}
    end
    if des == 'n'
      File.open("not_modal.txt","a+"){|f| f << s + "\n\n"}
    end
    if des == 'q'
      puts 'Shutting down!'
      break
    end
    i += 1
    puts sentences_filtered.length - i
  end
end

file = "../VP-Ellipsis-Examples-Thousands copy.txt"
punctuation = [",", ".", "?", "!", ";", ":"]

sentences = parse(file,"\r")
modal = parse('modal.txt', "\n\n")
not_modal = parse('not_modal.txt', "\n\n")

sentences_filtered = might_inclusion(sentences, punctuation)

sentences_filtered = sentences_filtered - modal - not_modal

divide(sentences_filtered)
