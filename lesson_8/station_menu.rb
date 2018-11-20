module StationMenu
  def create_station
    puts 'Введите название станции'
    answer = gets.chomp
    stations << Station.new(answer)
    puts "Вы успешно добавили станцию #{stations.last.name}"
  rescue RuntimeError => e
    puts e.message
    retry
  end
  
  def station_information
    stations.each do |station|
      puts "Нажмите #{stations.index(station)}, что бы посмотреть информацию по станции #{station.name}"
    end
    i = gets.chomp.to_i
    puts 'На станции стоят следующие поезда:'
    stations[i].trains_list do |train|
      puts "Номер поезда: #{train.number}."
    end
  end
end