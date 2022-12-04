#!/usr/bin/ruby
letters = {}
vow = 'aeiouy'
('a'..'z').each_with_index { |letter, index| letters[letter] = index + 1 if vow.include? letter }
puts letters
