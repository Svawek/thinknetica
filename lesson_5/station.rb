class Station
  include InstanceCounter

  attr_reader :trains, :name
  @@all_stations = []
  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def arrive_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end
end