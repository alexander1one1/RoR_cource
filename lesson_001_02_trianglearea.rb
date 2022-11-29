#!/usr/bin/ruby
def is_zero i
    if i.to_i == 0
        return true
    else
        return false
    end
end

main, height = 0, 0

puts "Tell main of triangle:"
while is_zero main
    main = STDIN.gets.chomp.to_i
    puts "Pls, type number!"
end

puts "Tell height of triangle:"
while is_zero height
    height = STDIN.gets.chomp.to_i
    puts "Pls, type number!"
end

square_area = 0.5 * main * height
puts "Square area of triangle is #{square_area}"