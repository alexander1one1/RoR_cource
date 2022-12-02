#!/usr/bin/ruby
months = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

def is_leap(year)
  if (year % 4 == 0)
    if (year % 100 == 0)
      if (year % 400 == 0)
        return true
      else
        return false
      end
    else
      return true
    end
  else
    return false
  end
end

puts "Tell me the year: "
user_year = gets.chomp.to_i

months[2] = 29 if is_leap(user_year)


user_month = 0
until (user_month  >= 1 && user_month <= 12) do
  puts "Tell me number of the month: "
  user_month = gets.chomp.to_i
end

user_days_can = Array.new
(1..months[user_month]).each {|d| user_days_can << d}

user_day = 0
until user_days_can.include?(user_day) do
  puts "Tell me number of the day: "
  user_day = gets.chomp.to_i
end


days_all = 0
months.each {|m, days|
  if m < user_month
    days_all += days
  else
    days_all += user_day
    break
  end 
}
puts "#{user_day}.#{user_month}.#{user_year} is #{days_all}'s day in #{user_year}"
