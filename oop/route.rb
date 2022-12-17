# frozen_string_literal: true

class Route
  attr_reader :stations
  def initialize(start_station, finish_station)
    @stations = [start_station, finish_station]
  end

  def add_checkpoint(station)
    if @stations.include?(station)
      puts "#{station.name} already in this route"
    else
      @stations.insert(-2, station)
      puts "#{station.name} added to this route"
    end
  end

  def remove_checkpoint(station)
    if @stations.include?(station)
      if @stations.first == station || @stations.last == station
        puts "#{station.name} is edge station, can't change that"
      else
        @stations.delete(station)
        puts "#{station.name} removed from this route"
      end
    else
      puts "#{station.name} not in route"
    end

  end

  def print_route
    stations_arr = []
    @stations.each { |station| stations_arr << station.name }
    puts "Stations: #{stations_arr.join(", ")}"
  end
end
