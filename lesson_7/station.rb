class Station
  include InstanceCounter
  STATION_NAME_FORMAT = /[a-zа-я]+.*/i

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
    validate!
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

  def trains_list(&block)
    self.trains.each { |train| block.call(train) }
  end
  
  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!
    raise "Название станции не может быть nil" if self.name.nil?
    raise "Название станции должно содержать как минимум 1 букву" if self.name !~ STATION_NAME_FORMAT
  end
end
