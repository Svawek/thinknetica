class Station
  attr_reader :train_list, :train_type, :station_name
  def initialize (station_name)
    @station_name = station_name
    @train_list = []
    @train_type = {passenger_train: 0, freight_train: 0}
  end

  def add_train (train)
    self.train_list << train.train_number
    train.train_type == "passenger train" ? self.train_type[:passenger_train] += 1 : self.train_type[:freight_train] += 1
  end

  def send_train (train)
    self.train_list.delete(train.train_number)
    train.train_type == "passenger train" ? self.train_type[:passenger_train] -= 1 : self.train_type[:freight_train] -= 1
  end
end

class Route
  attr_reader :station_list
  def initialize (station_first, station_last)
    @station_first = station_first.station_name
    @station_last = station_last.station_name
    @station_list = [@station_first, @station_last]
  end

  def add_station (station)
    self.station_list.insert(-2, station.station_name)
  end

  def remove_station (station)
    self.station_list.delete(station.station_name)
  end
end

class Train
  attr_reader :train_number, :train_type
  attr_accessor :current_speed, :carriage_amount, :train_route, :current_position
  def initialize (train_number, train_type, carriage_amount)
    @train_number = train_number
    @train_type = train_type
    @carriage_amount = carriage_amount
    @current_speed = 0
  
  end

  def acceleration (speed_up)
    self.current_speed += speed_up
  end

  def braking (speed_down)
    current_speed - speed_down < 0 ? self.current_speed = 0 : self.current_speed -= speed_down 
  end

  def carriage_increase
    current_speed == 0 ? self.carriage_amount += 1 : "The train is moving. Please, stop the train."
  end

  def carriage_decrease
    carriage_amount == 0 ? "You have no carriage" : current_speed == 0 ? self.carriage_amount -= 1 : "The train is moving. Please, stop the train."
  end

  def route (route)
    self.train_route = route.station_list
    self.current_position = train_route.first
  end

  def drive_forward
    current_position != train_route.last ? self.current_position = train_route[train_route.index(current_position) + 1] : "The train stop at the last station."
  end

  def drive_back
    current_position != train_route.first ? self.current_position = train_route[train_route.index(current_position) - 1] : "The train stop at the first station."
  end

  def position
    if current_position == train_route.last
      position = [train_route[train_route.index(current_position) - 1], current_position, nil]
    elsif current_position == train_route.first
      position = [nil ,current_position, train_route[train_route.index(current_position) + 1]]
    else
      position = [train_route[train_route.index(@current_position) - 1], current_position, train_route[train_route.index(current_position) + 1]]
    end
  end
end