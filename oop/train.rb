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
    # *? Правильнее = nil или просто @route ?
    @route = nil
    @current_station = nil
    @current_station_index = nil
  end

  def increace_speed(speed)
    @speed += speed
    puts "Speed was up on #{speed} and now is #{@speed}"
  end

  def stop
    @speed = 0
    puts "Train #{number} stoped"
  end

  def print_speed
    puts "Speed of train: #{speed}"
  end

  def add_wagons(count)
    if @speed.zero?
      if @wagons_count + count <= @wagons_max
        @wagons_count += count
        puts "Train № #{@number}: #{count} wagons added, now is #{@wagons_count}"
      else
        puts "Train № #{@number}: Wagons will be more than max if we will add, can't add wagons"
      end
    else
      puts "Train № #{@number}: Train goin, can't add wagons"
    end

  end

  def remove_wagons(count)
    if count.positive?
      if @speed.zero?
        if @wagons_count - count >= 0
          @wagons_count -= count
          puts "Train № #{@number}: was #{@wagons_count + count} wagons, now is #{@wagons_count}"
        else
          puts "Train № #{@number}: can't remove wagons cuz their count less then need to remove"
        end
      else
        puts "Train № #{@number}: Train goin, can't remove wagon(s)"
      end
    else
      puts "Not valid count of wagons"
    end
  end

  def give_route(route)
    if route.stations.first.trains_in_station.include?(self)
      puts "Train #{number} already on #{route.stations.first.name}"
    else
      @route = route
      @current_station_index = 0
      @current_station = @route.stations.first
      @current_station.train_in(self)
      puts "#{number} on #{route.stations.first.name} and ready to move"
    end
  end

  def move_to_next_station
    return "can't move train next, cuz last" unless (0..@route.stations.count - 1).include?(@current_station_index + 1)
    @current_station_index += 1
    @current_station.train_out(self)
    @current_station = @route.stations[@current_station_index]
    @current_station.train_in(self)
    "train moved next"
  end

  def move_to_prev_station
    return "can't move train prev, cuz first" unless (0..@route.stations.count - 1).include?(@current_station_index - 1)
    @current_station_index += 1
    @current_station.train_out(self)
    @current_station = @route.stations[@current_station_index]
    @current_station.train_in(self)
    "train moved prev"
  end

  def current_station
    @current_station
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end
  def prev_station
    @route.stations[@current_station_index - 1]
  end

  def print_near_stations
    "#{prev_station.name} => #{current_station.name} => #{next_station.name}"
  end
end
