<<<<<<< HEAD
# Class make route for railway
=======
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
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
