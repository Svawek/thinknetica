# Module create new modified accessors
module Accessors
  def self.included(base)
    base.extend ClassMethods
    #base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |arg|
        var_name = "@#{arg}".to_sym
        history_name = "@history_#{arg}".to_sym
        define_method(arg) { instance_variable_get(var_name) }
        define_method("#{arg}=".to_sym) do |value| 
          instance_variable_set(var_name, value) 
          instance_variable_set(history_name, []) unless instance_variable_get(history_name)
          instance_variable_get(history_name).push(value)
        end
        define_method("#{arg}_history") { instance_variable_get(history_name) }
      end
    end

    def strong_attr_accessor(attribute, type)
      define_method(attribute) { instance_variable_get(attribute) }
      define_method("#{attribute}=".to_sym) do |value| 
        raise ArgumentError, 'Не верный класс значения' unless value.is_a?(type)
        instance_variable_set(var_name, value)
      end
    end
  end
end

# Class create and manage train
class Train
  include Accessors
  TRAIN_NUMBER_FORMAT = /\w{3}-?\w{2}/.freeze
  @@all_trains = {}

  def self.all
    @@all_trains
  end

  def self.find(number)
    @@all_trains[number]
  end

  attr_reader :number, :current_speed, :station_index, :carriages
  attr_accessor_with_history :route
  def initialize(number)
    @number = number
    @current_speed = 0
    @station_index = 0
    @carriages = []
    @@all_trains[number] = self
  end


  def assign_route(route)
    self.route = route
    self.route.stations[0].arrive_train(self)
  end

  protected

  # protect against changing parameters on the line. is inherited
  attr_writer :current_speed, :station_index

end

# Class make route for railway
class Route

  attr_reader :stations
  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end
end

# Class create Station. View information about staion(trains)
class Station
  STATION_NAME_FORMAT = /[a-zа-я]+.*/i.freeze

  @@all_stations = []

  def self.all
    @@all_stations
  end

  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
  end

  def arrive_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def trains_list
    trains.each { |train| yield(train) }
  end
end


station1 = Station.new("A")
station2 = Station.new("B")
route1 = Route.new(station1, station2)
train1 = Train.new("12345")
train1.assign_route(route1)
  train1.route_history
