# Class create and manage train
class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  include Accessors
  TRAIN_NUMBER_FORMAT = /\w{3}-?\w{2}/.freeze
  @@all_trains = {}

  def self.all
    @@all_trains
  end

  def self.find(number)
    @@all_trains[number]
  end

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  attr_reader :number, :current_speed, :station_index, :carriages
  attr_accessor_with_history :route
  def initialize(number)
    @number = number
    @current_speed = 0
    @station_index = 0
    @carriages = []
    @@all_trains[number] = self
    register_instance
    validate!
  end

  def acceleration(speed_up)
    self.current_speed += speed_up
  end

  def braking(speed_down)
    if self.current_speed - speed_down < 0
      self.current_speed = 0
    else
      self.current_speed -= speed_down
    end
  end

  def carriage_join(carriage)
    return error_stop_train if current_speed != 0

    if carriage.type == type
      carriages << carriage
    else
      error_type_carriage
    end
  end

  def carriage_disconnect(carriage)
    if current_speed != 0
      puts error_stop_train
    elsif carriages.include?(carriage)
      carriages.delete(carriage)
    else
      error_no_carriage
    end
  end

  def assign_route(route)
    self.route = route
    self.route.stations[0].arrive_train(self)
  end

  def drive_forward
    current_station.send_train(self)
    return error_last_station if station_index == route.stations.length - 1

    self.station_index += 1
    current_station.arrive_train(self)
  end

  def drive_back
    current_station.send_train(self)
    return error_first_station if station_index.zero?

    self.station_index -= 1
    current_station.arrive_train(self)
  end

  def current_station
    route.stations[station_index]
  end

  def previous_station
    return error_first_station if station_index.zero?

    route.stations[station_index - 1]
  end

  def next_station
    return error_last_station if station_index == route.stations.length - 1

    route.stations[station_index + 1]
  end

  def carriages_list
    carriages.each { |carriage| yield(carriage) }
  end

  def error_stop_train
    puts 'Поезд движется. Остановите сначало поезд!'
  end

  def error_type_carriage
    puts 'Тип поезда и вагона разные.'
  end

  def error_no_carriage
    puts 'У Вас нет такого вагона.'
  end

  def error_last_station
    puts 'Поезд стоит на последней станции.'
  end

  def error_first_station
    puts 'Поезд стоит на первой станции.'
  end

  protected

  # protect against changing parameters on the line. class is inherited
  attr_writer :current_speed, :station_index
end
