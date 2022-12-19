#!/usr/bin/ruby
load 'oop/train.rb'
load 'oop/station.rb'
load 'oop/route.rb'

names_template = [
  'first',
  'second',
  'third',
  'fourth',
  'fifth'
]

need_trains = 3
need_routes = 10
need_stations = names_template.size
train_types = ["passenger", "cargo"]

trains = []
routes = []
stations = []

# Создаём тестовые поезда
need_trains.times.each do |number_train|
  trains << Train.new("#{number_train}_train", train_types.sample, rand(7))
end

# Создаём тестовые станции
names_template.each do |number|
  stations << Station.new("#{number}_station".capitalize)
end

puts "=== \nOperations with wagons:"
5.times.each { trains[0].add_wagons(rand(5)) }
5.times.each { trains[0].remove_wagons(rand(5)) }

puts "=== \nSet routes:"
need_routes.times.each do |number_route|
  temp_stations = stations.sample(2)
  temp_route = Route.new(temp_stations[0], temp_stations[1])
  routes << Route.new(stations.sample, stations.sample)
  2.times.each { routes[number_route].add_checkpoint(stations.sample) }
  routes[number_route].print_route
end

puts "=== \nTrain moves:"
routes[0].print_route
trains[0].give_route(routes[0])
trains[0].print_speed
trains[0].print_near_stations
puts trains[0].move_to_next_station
puts trains[0].move_to_prev_station
puts trains[0].move_to_next_station
puts trains[0].move_to_next_station
puts trains[0].move_to_next_station
puts trains[0].move_to_next_station

train_0_cargo_trains_count = stations[0].get_count_trains_by_type(train_types[1])
if train_0_cargo_trains_count > 0
  puts "Trains with #{train_types[1]} list on #{@name}:"
  train_0_cargo_trains = stations[0].get_trains_by_type(train_types[1])
  train_0_cargo_trains.each do |train|
    puts train.number
  end
else
  puts "On #{stations[0]} no trains with type #{train_types[1]}"
end


trains.each { |train| puts train.inspect } # Вывод поездов
routes.each { |route| puts route.inspect } # Вывод маршрутов
stations.each { |station| puts station.inspect } # Вывод станций
