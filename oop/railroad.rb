#!/usr/bin/ruby
#require_relative 'train'
#require_relative 'station'
#load './oop/train'
load 'oop/train.rb'
load 'oop/station.rb'
load 'oop/route.rb'
require 'colorize'
#require 'train.rb'
#require 'station.rb'

names_template = [
  'first',
  'second',
  'third',
  'fourth',
  'fifth'
]

need_trains = 3
need_stations = names_template.size

trains = []
stations = []

# Создаём тестовые поезда
need_trains.times.each do |number_train|
  trains << Train.new("#{number_train}_train", 'passenger', rand(7))
end

# Создаём тестовые станции
names_template.each do |number|
  stations << Station.new("#{number}_station".capitalize)
end

trains.each { |train| puts train.number } # Вывод номеров поездов
stations.each { |station| puts station.name } # Вывод названий станций


trains[0].add_wagons(rand(5))
route_1 = Route.new(stations[0], stations[1])
trains[0].give_route(route_1)
#trains.each do |train|
#  train.add_wagons(rand(5))
#  train.give_route()
#end