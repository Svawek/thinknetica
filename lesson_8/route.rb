class Route
  include InstanceCounter

  attr_reader :stations
  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end
end
