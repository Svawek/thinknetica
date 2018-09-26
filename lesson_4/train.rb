class Train
  attr_reader :number, :current_speed, :route, :station_index, :carriages
  def initialize(number)
    @number = number
    @current_speed = 0
    @station_index = 0
    @carriages = []
  end

  def acceleration(speed_up)
    self.current_speed += speed_up
  end

  def braking(speed_down)
    current_speed - speed_down < 0 ? self.current_speed = 0 : self.current_speed -= speed_down 
  end

  def carriage_increase(carriage)
    return "The train is moving. Please, stop the train." if current_speed != 0
    if carriage.type == train.type
      self.carriages << carriage
    else
      "Type of carriage and train are different"
    end
  end

  def carriage_decrease(carriage)
    if current_speed != 0
      "The train is moving. Please, stop the train."
    elsif carriages.include?(carriage)
      self.carriages.delete(carriage)
    else
      "You have no such carriage"
    end
  end

  def set_route(route)
    self.route = route
    self.route.stations[0].add_train(self)
  end

  def drive_forward
    route.stations[station_index].send_train(self)
    return "The train stop at the last station." if station_index == route.stations.length - 1
    self.station_index += 1
    route.stations[station_index].add_train(self)
  end

  def drive_back
    route.stations[station_index].send_train(self)
    return "The train stop at the first station." if station_index == 0
    self.station_index -= 1
    route.stations[station_index].add_train(self)
  end

  def current_station
    route.stations[station_index]
  end

  def previous_station
    return "The train stop at the first station." if station_index == 0
    route.stations[station_index - 1]
  end

  def next_station
    return "The train stop at the last station." if station_index == route.stations.length - 1
    route.stations[station_index + 1]
  end

  protected
  # защищаем от изменения параметров на прямую
  attr_writer :current_speed, :route, :station_index
end