class Train
  include Manufacturer
  include InstanceCounter
  @@all_trains = {}

  def self.all
    @@all_trains
  end

  def self.find(num)
    @@all_trains[num]
  end

  attr_reader :number, :current_speed, :route, :station_index, :carriages
  def initialize(number)
    @number = number
    @current_speed = 0
    @station_index = 0
    @carriages = []
    @type
    @@all_trains[number] = self
    register_instance
  end

  def acceleration(speed_up)
    self.current_speed += speed_up
  end

  def braking(speed_down)
    current_speed - speed_down < 0 ? self.current_speed = 0 : self.current_speed -= speed_down 
  end

  def carriage_join(carriage)
    return puts "The train is moving. Please, stop the train." if current_speed != 0
    if carriage.type == type
      self.carriages << carriage
    else
      puts "Type of carriage and train are different"
    end
  end

  def carriage_disconnect(carriage)
    if current_speed != 0
      puts "The train is moving. Please, stop the train."
    elsif carriages.include?(carriage)
      self.carriages.delete(carriage)
    else
      puts "You have no such carriage"
    end
  end

  def set_route(route)
    self.route = route
    self.route.stations[0].add_train(self)
  end

  def drive_forward
    current_station.send_train(self)
    return puts "The train stop at the last station." if station_index == route.stations.length - 1
    self.station_index += 1
    current_station.add_train(self)
  end

  def drive_back
    current_station.send_train(self)
    return puts "The train stop at the first station." if station_index == 0
    self.station_index -= 1
    current_station.add_train(self)
  end

  def current_station
    route.stations[station_index]
  end

  def previous_station
    return puts "The train stop at the first station." if station_index == 0
    route.stations[station_index - 1]
  end

  def next_station
    return puts "The train stop at the last station." if station_index == route.stations.length - 1
    route.stations[station_index + 1]
  end

  protected
  # защищаем от изменения параметров на прямую. класс наследуется
  attr_writer :current_speed, :route, :station_index
end
