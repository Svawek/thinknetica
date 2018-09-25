class Station
  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @trains = []
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