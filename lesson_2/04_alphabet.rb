#!/usr/bin/ruby
puts ('a'..'z').each_with_index {|l,i| letters[l] = i + 1 if 'aeiouy'.include? l}
