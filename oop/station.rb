# frozen_string_literal: true

class Station
  attr_reader :name, :trains_max, :trains_in_station
  def initialize(name)
    @name = name
    @trains_in_station = []
  end

  def train_in(train)
    if @trains_in_station.include?(train)
      puts 'Train here already'
    else
      @trains_in_station << train
      train.stop
      puts "#{train.number} arrived in #{@name}"
    end
  end

  def train_out(train)
    if @trains_in_station.include?(train)
      @trains_in_station.delete(train)
      puts "#{train.number} left #{@name}"
      train.increace_speed(50)
    else
      puts "#{train.number} not in #{@name}"
    end
  end

  def get_trains_list
    puts "Trains list on #{@name}:"
    @trains_in_station.each do |train|
      puts "№#{train.number}, is #{train.type} with #{train.wagons_count} wagons"
    end
  end

  def get_trains_by_type(type)
    @trains_in_station.select { |train| train.type == type }
  end

  def get_count_trains_by_type(type)
    get_trains_by_type(type).count
  end
end
