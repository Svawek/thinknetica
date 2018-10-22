class Station
  attr_reader :trains, :name
  @@all_stations = []
  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << {name: @name, train: @train}
  end

  def add_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  def train_types(type)
    trains.select { |train| train.type == type }
  end
end