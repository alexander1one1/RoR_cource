#!/usr/bin/ruby
puts "What's ur name?"
name = gets.chomp.capitalize

puts "Tell us ur height:"
height = 0
while height == 0
  height = gets.chomp.to_i
  puts "Pls, type number!"
end

optimal = (height - 110) * 1.15
if optimal >= 0
  puts "Ur optimal weight is #{optimal.to_i}"
else
  puts "Ut weight is ok!"
end
