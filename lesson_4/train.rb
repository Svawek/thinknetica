class Train
  attr_reader :number, :current_speed, :carriage_amount, :route, :station_index
  def initialize(number, type, carriage_amount)
    @number = number
    @type = type # УБРАТЬ В ПОЕЗДА ТИПЫ!!!
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
  attr_writer :current_speed, :carriage_amount, :route, :station_index
end