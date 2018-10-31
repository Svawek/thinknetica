class Route
  include InstanceCounter

  attr_reader :stations
  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
    register_instance
    validate!
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    self.stations.delete(station)
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private
  def validate!
    raise "Cтанции должны быть объектами класса Station" unless stations.all? { |station| station.is_a?(Station)}
  end
end
