class Station
  attr_reader :trains, :station_name
  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def add_train(train)
    self.trains << [train.train_number, train.train_type]
  end

  def send_train(train)
    self.trains.delete([train.train_number, train.train_type])
  end

  def train_types(type)
    trains.select { |train| train if train[1] == type }
  end
end

class Route
  attr_reader :stations
  def initialize(station_first, station_last)
    @stations = [station_first.station_name, station_last.station_name]
  end

  def add_station(station)
    self.stations.insert(-2, station.station_name)
  end

  def remove_station(station)
    self.stations.delete(station.station_name)
  end
end

class Train
  attr_reader :train_number, :train_type
  attr_accessor :current_speed, :carriage_amount, :train_route, :station_index
  def initialize(train_number, train_type, carriage_amount)
    @train_number = train_number
    @train_type = train_type
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

  def route(route)
    self.train_route = route.stations
  end

  def drive_forward
    return "The train stop at the last station." if station_index == train_route.length - 1
    self.station_index += 1
  end

  def drive_back
    return "The train stop at the first station." if station_index == 0
    self.station_index -= 1
  end

  def current_station
    train_route[station_index]
  end

  def previous_station
    return "The train stop at the first station." if station_index == 0
    train_route[station_index - 1]
  end

  def next_station
    return "The train stop at the last station." if station_index == train_route.length - 1
    train_route[station_index + 1]
  end
end
