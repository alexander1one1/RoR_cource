#!/usr/bin/ruby
def fib(nums, limit)
  sum_nums = nums[-2] + nums[-1]
  if sum_nums <= limit
    nums << sum_nums
    fib(nums, limit)
  end
end

fib_nums = [0, 1]
limit = 100
fib(fib_nums, limit)
puts "Fibo before #{limit}: #{fib_nums.join(' ')}"

puts 'На случай, если в задании имелось в виду просто итерация из 100 циклов:'
fib_nums_2 = [0, 1]
limit.times { fib_nums_2 << fib_nums_2[-2] + fib_nums_2[-1] }
puts "Fibo for #{limit} times: #{fib_nums_2.join(' ')}"
