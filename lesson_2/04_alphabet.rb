#!/usr/bin/ruby
letters = Hash.new
('a'..'z').each_with_index {|l,i| letters[l] = i + 1}
puts letters
