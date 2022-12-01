#!/usr/bin/ruby
def is_zero i
  if i.to_i == 0
    return true
  else
    return false
  end
end

sides = [0, 0, 0]

puts "Tell triangle side 1:"
while is_zero sides[0]
  sides[0] = STDIN.gets.chomp.to_i
  puts "Pls, type number!" if is_zero sides[0]
end

puts "Tell triangle side 2:"
while is_zero sides[1]
  sides[1] = STDIN.gets.chomp.to_i
  puts "Pls, type number!" if is_zero sides[1]
end

puts "Tell triangle side 3:"
while is_zero sides[2]
  sides[2] = STDIN.gets.chomp.to_i
  puts "Pls, type number!" if is_zero sides[2]
end

if sides.uniq.size <= 1
  puts "Это равносторонний треугольник"
  exit
end

largest, largest_i = sides.each_with_index.max
sides.delete_at(largest_i)

if sides[0] == sides[1]
  puts "Это равнобедренный треугольник"
  exit
end

sq_side_largest = largest ** 2
sq_sides_lateral = sides[0]**2 + sides[1]**2
puts sides
if sq_side_largest == sq_sides_lateral
  puts "Это прямоугольный треугольник"
else
  puts "Это обычный треугольник"
end
