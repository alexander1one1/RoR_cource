#!/usr/bin/ruby

def calculate_disc coefs_list
    a, b, c = coefs_list
    a, b, c = a.to_i, b.to_i, c.to_i
    d = b ^ 2 - 4 * a * c
    if d < 0
        return "Уравнение решений не имеет", d, nil, nil
    elsif d == 0
        x1 = -b / (2 * a)
        return "Один корень", d, x1, nil
    else
        x1 = -b + Math.sqrt(d) / (2 * a)
        x2 = -b - Math.sqrt(d) / (2 * a)
        return "Два корня", d, x1, x2
    end
end

coef_size = 0
puts "Введите три коэффицента через пробел"
while coef_size != 3
    coefs = gets.chomp.split
    coef_size = coefs.size
    puts "Введите как надо, пожайлуйста" if coef_size != 3
end

disc = calculate_disc coefs
puts "#{disc[0]} для дискриминанта #{disc[1]}. #{disc[2] if disc[2]} #{disc[3] if disc[3]}"
