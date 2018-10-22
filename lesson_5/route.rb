class Route
  attr_reader :stations
  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    self.stations.delete(station)
  end
end