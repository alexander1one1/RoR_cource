#!/usr/bin/ruby
goods = {}

def get_positive_f_console
  num = 0.0

  while num <= 0.0
    num = gets.chomp.to_f
    puts 'Write normal number please' if num <= 0.0
  end

  return num
end

loop do
  puts 'Write good name or "stop" to stop it'
  good_name_not_repeated = true

  while good_name_not_repeated
    good_name = gets.chomp.capitalize!
    good_name_not_repeated = goods.keys.include?(good_name)
    puts 'This name exist already, please write other' if good_name_not_repeated
  end

  break if good_name == 'Stop'

  puts "Write count of #{good_name}:"
  count = get_positive_f_console.round

  puts "Write price for every of #{good_name}:"
  price = get_positive_f_console

  this_good = { good_name => {
    'count' => count,
    'price' => price
  } }
  goods.merge!(this_good)
end

total_price = 0
goods.each do |name, info|
  this_good_total = info['count'] * info['price']
  puts "#{name}: #{info['count']} things by #{info['price'].round(2)}$. In total it cost: #{this_good_total.round(2)}$"
  total_price += this_good_total
end

puts "Total to pay: #{total_price.round(2)}$"
