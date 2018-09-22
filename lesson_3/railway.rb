class Station
  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  def train_types(type)
    trains.select { |train| train if train.type == type }
  end
end

class Route
  attr_reader :stations
  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    self.stations.delete(station)
  end
end

class Train
  attr_reader :number, :type
  attr_accessor :current_speed, :carriage_amount, :route, :station_index
  def initialize(number, type, carriage_amount)
    @number = number
    @type = type
    @carriage_amount = carriage_amount
    @current_speed = 0
    @station_index = 0
  end

  def acceleration(speed_up)
    self.current_speed += speed_up
  end

  def braking(speed_down)
    current_speed - speed_down < 0 ? self.current_speed = 0 : self.current_speed -= speed_down 
  end

  def carriage_increase
    current_speed == 0 ? self.carriage_amount += 1 : "The train is moving. Please, stop the train."
  end

  def carriage_decrease
    if current_speed != 0
      "The train is moving. Please, stop the train."
    elsif carriage_amount == 0
      "You have no carriage"
    else
      self.carriage_amount -= 1
    end
  end

  def set_route(route)
    self.route = route
  end

  def drive_forward
    return "The train stop at the last station." if station_index == route.stations.length - 1
    self.station_index += 1
  end

  def drive_back
    return "The train stop at the first station." if station_index == 0
    self.station_index -= 1
  end

  def current_station
    route.stations[station_index].name
  end

  def previous_station
    return "The train stop at the first station." if station_index == 0
    route.stations[station_index - 1].name
  end

  def next_station
    return "The train stop at the last station." if station_index == route.stations.length - 1
    route.stations[station_index + 1].name
  end
end
