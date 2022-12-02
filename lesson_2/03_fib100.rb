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
puts "Fibo before #{limit.to_s}: " + fib_nums.join(" ")
