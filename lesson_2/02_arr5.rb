#!/usr/bin/ruby
arr_100 = Array.new
(5..100).each {|r| arr_100 << r if r % 5 == 0} # variant 1
puts "variant 1: " + arr_100.join(" ")

arr_100 = Array.new
(5..100).step(5).each  { |r| arr_100 << r} # variant 2
puts "variant 2: " + arr_100.join(" ")
