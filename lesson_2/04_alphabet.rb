#!/usr/bin/ruby
letters = Hash.new
vow = 'aeiouy'
('a'..'z').each_with_index {|l,i| letters[l] = i + 1 if vow.include? l}
puts letters
