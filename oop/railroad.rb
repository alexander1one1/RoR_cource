#!/usr/bin/ruby
#require_relative 'train'
#require_relative 'station'
#load './oop/train'
load 'oop/train.rb'
load 'oop/station.rb'
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

need_trains.times.each do |number_train|
  trains << Train.new("#{number_train}_train", 'pass', rand(7))
end

names_template.each do |number|
  stations << Station.new("#{number}_station".capitalize)
end

puts trains
stations.each { |station| puts station.name.cyan }