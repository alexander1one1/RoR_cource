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
  end

  def encreace_speed(speed)
    @speed += speed
    puts "Speed was up on #{speed} and now is #{@speed}"
  end

  def stop
    @speed = 0
    puts "Train #{number} stoped"
  end

  def get_speed
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
    if route.stations.first.trains_in_station.size >= route.stations.first.trains_max
      puts "Can't put more trains on #{route.first.name}"
    elsif route.stations.first.trains_in_station.include?(self)
      puts "Train #{number} already on #{route.stations.first.name}"
    else
      @route = route
      @current_station = @route.stations.first
      @current_station.train_in(self)
      puts "#{number} on #{route.stations.first.name} and ready to move"
    end

  end

  def move_train(direct)
    if (direct != "forward") && (direct != "reward")
      puts "write right direction (forward||reward)"
      return nil
    end
    puts "Moving train to #{direct}"
    index_stations = can_move_arround
    if direct == "forward"
      if index_stations[0].nil?
        puts "train can't move forward, it's last station"
      else
        current_station_name = @current_station.name
        @current_station.train_out(self)
        @route.stations[index_stations[0]].train_in(self)
        @current_station.train_in(self)
        puts "Train № #{@number} moved from #{current_station_name} to #{@current_station.name}"
      end
    else
      if index_stations[1].nil?
        puts "train can't move reward, it's first station"
      else
        current_station_name = @current_station.name
        @current_station.train_out(self)
        @route.stations[index_stations[1]].train_in(self)
        @current_station = @route.stations[index_stations[0]]
        @current_station.train_in(self)
        puts "Train № #{@number} moved from #{current_station_name} to #{@current_station.name}"
      end
    end
  end

  def can_move_arround
    route_size = @route.stations.size
    current_station_index = @route.stations.index(@current_station)
    index_station_forward = @route.stations.index(@current_station) - 1 if current_station_index < route_size - 1
    index_station_reward = @route.stations.index(@current_station) + 1 if current_station_index > 0
    [index_station_forward, index_station_reward]
  end

  def print_stations_arround
    return "No route for train № #{@number}" if @route.nil?
    index_stations = can_move_arround
    message = ""
    if index_stations[0]
      station_name = @route.stations[index_stations[0]].name
      message += "Previous station is #{station_name}"
    else
      message += "No previous station"
    end
    message += "; Current station is #{@current_station.name} ;"
    if index_stations[1]
      station_name = @route.stations[index_stations[1]].name
      message += "Next station is #{station_name}"
    else
      message += "No next station"
    end
    message
  end
end
