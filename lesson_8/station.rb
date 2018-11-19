<<<<<<< HEAD
=======
# Class create Station. View information about staion(trains)
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
class Station
  include InstanceCounter
  STATION_NAME_FORMAT = /[a-zа-я]+.*/i.freeze

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

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Название станции не может быть nil' if name.nil?
<<<<<<< HEAD
    raise 'Название станции должно содержать как минимум 1 букву' if name !~ STATION_NAME_FORMAT
=======
    if name !~ STATION_NAME_FORMAT
      raise 'Название станции должно содержать как минимум 1 букву'
    end
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
  end
end
