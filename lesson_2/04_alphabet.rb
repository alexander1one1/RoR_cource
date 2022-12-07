#!/usr/bin/ruby
letters = {}
vowels = 'aeiouy'
('a'..'z').each_with_index { |letter, index| letters[letter] = index + 1 if vowels.include? letter }
puts letters
