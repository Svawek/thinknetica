# Class create Station. View information about staion(trains)
class Station
  include InstanceCounter
  include Validation
  STATION_NAME_FORMAT = /[a-zа-я]+.*/i.freeze
  validate :name, :format, STATION_NAME_FORMAT

  @@all_stations = []

  def self.all
    @@all_stations
  end

  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
    validate!
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
