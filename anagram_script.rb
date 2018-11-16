#!/usr/bin/env ruby
require('./lib/word_compare')

puts "Welcome to the anagram checker"
puts "Type in two words or phrases and then press Enter (Leave both blank to quit)"
word_compare = WordCompare.new()
done = false
while !done
  print "  Phrase 1:"
  phrase0 = gets.chomp
  print "  Phrase 2:"
  phrase1 = gets.chomp
  if (phrase0 != '') & (phrase1 != '')
    puts word_compare.anagram(phrase0, phrase1)
  else
    done = true
  end
end
