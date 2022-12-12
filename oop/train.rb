# frozen_string_literal: true

class Train
  # *? Писать в линию аттрибуты это норма? Или лучше не жалеть строк?
  attr_reader :number, :type, :wagons_count, :speed
  def initialize(number, type, wagons_count)
    @number = number.to_s
    @type = type
    @wagons_count = wagons_count
    @wagons_max = 8
    @speed = 0
    @route = nil
    @current_station = nil
  end

  def encreace_speed(speed)
    @speed += speed
    puts "Speed was up on #{speed} and now is #{@speed}"
  end

  def stop
    @speed = 0
    puts "Train #{self.number} stoped"
  end

  def get_speed
    puts "Speed of train: #{self.speed}"
  end

  def add_wagons(count)
    # *? Стоит ли стремиться к такому сокращению при подобных условиях, нескольких командах,
    # *? или лучше использовать обычные блоки if else?
    @wagons_count += count; puts "#{count} wagons added, now is #{@wagons_count}" if @speed.zero?
    puts 'Train goin, can\'t add wagon' if @speed.nonzero?
  end

  def remove_wagons(count)
    @wagons_count -= count if @speed.zero?
  end

  def give_route(route)
    if route.first.trains_in_station.size >= route.first.trains_max
      puts "Can't put more trains on #{route.first.name}"
    elsif route.first.trains_in_station.include?(self)
      puts "Train #{self.number} already on #{route.first.name}"
    else
      @route = route
      @current_station = @route.first
      puts "#{self.number} on #{route.first.name} and ready to move"
    end

  end

  def move_train(direct)
    puts "Move train to #{direct}"
    # if direct == "forward"
    #   encreace_speed(50)
    # end
    # @speed
  end

  def get_stations_arround
    puts @route
  end
end
