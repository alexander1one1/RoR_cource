# frozen_string_literal: true

class Route
  attr_reader :route
  def initialize(start_station, finish_station)
    @route = [start_station, finish_station]
  end

  def add_checkpoint(station)
    @route.insert(-2, station)
  end

  def remove_checkpoint(station)
    @route.remove_instance_variable(station)
  end

  def print_route
    puts "Stations: #{@route.names.join(", ")}"
  end
end
