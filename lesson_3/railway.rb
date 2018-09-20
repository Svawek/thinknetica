class Station
  attr_reader :train_list
  def initialize (station_name)
    @station_name = station_name
    @train_list = []
  end

  def add_train (train_name)
    @train_list << train_name
  end

  def send_train (train_name)
    @train_list[train_name].delete
  end
end

class Route
  attr_reader :station_list
  def initialize (station_first, station_last)
    @station_first = station_first
    @station_last = station_last
    @station_list = [@station_first, @station_last]
  end

  def add_station (station_name)
    @station_list.insert(-2, station_name)
  end

  def remove_station (station_name)
    @station_list[station_name].remove
  end
end

class Train
  attr_reader :current_speed
  attr_reader :carriage_amount
  def initialize (train_number, train_type, carriage_amount)
    @train_number = train_number
    @train_type = train_type
    @carriage_amount = carriage_amount
    @current_speed = 0
    @current_position
  end

  def acceleration (speed_up)
    @current_speed += speed_up
  end

  def braking (speed_down)
    @current_speed - speed_down < 0 ? @current_speed =0 : @current_speed -= speed_down 
  end

  def carriage_increase
    @current_speed == 0 ? carriage_amount += 1 : puts "The train is moving. Please, stop the train."
  end

  def carriage_decrease
    @carriage_amount == 0 ? puts "You have no carriage" : @current_speed == 0 ? carriage_amount -= 1 : puts "The train is moving. Please, stop the train."
  end

  def train_route (route)
    @train_route = route.station_list
    @current_position = @train_route.first
  end

end