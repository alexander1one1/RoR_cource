# frozen_string_literal: true

class Station
  attr_reader :name, :trains_max, :trains_in_station
  def initialize(name)
    @name = name
    @trains_max = 1
    @trains_in_station = []
  end

  def train_in(train)
    @trains_in_station << train
    puts "#{train.number} arrived in #{@name}"
  end

  def train_out(train)
    @trains_in_station.delete_at(train)
    puts "#{train.number} left #{@name}"
  end

  def get_trains_list
    # *? В данном случае лучше использовать self. ? Или @?
    puts "Trains list on #{self.name}:"
    @trains_in_station.each do |train|
      puts "№#{train.number}, is #{train.type} with #{train.wagons_count} wagons"
    end
  end

  def get_trains_by_type(type)
    puts "Trains with #{type} list on #{self.name}:"
    # * Да, это не очень хорошо с отдельным каунтером и обычным циклом и условием, без изяществ
    count_trains = 0
    @trains_in_station.each do |train|
      if train.type == "type"
        puts "№#{train.number}, is #{train.type} with #{train.wagons_count} wagons"
        count_trains += 1
      end
      puts 'No trains'
    end
  end
end
