#!/usr/bin/ruby
arr_100 = []
(5..100).each { |number| arr_100 << number if (number % 5).zero? } # variant 1
puts "variant 1: #{arr_100.join(' ')}"

arr_100 = []
(5..100).step(5).each { |number| arr_100 << number } # variant 2
puts "variant 2: #{arr_100.join(' ')}"
