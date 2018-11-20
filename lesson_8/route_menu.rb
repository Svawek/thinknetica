module RouteMenu
  def create_route
    create_route!
  end

  def manage_route
    routes.each do |route|
      puts "Что бы выбрать маршрут #{route.stations.first.name} - #{route.stations.last.name}, нажмите #{routes.index(route)}"
    end
    i = gets.chomp.to_i

    puts 'Нажмите 1, что бы посмотреть все станции маршрута'
    puts 'Нажмите 2 , что бы добавить станцию в маршрут'
    puts 'Нажмите 3, что бы удалить станцию с маршрута'

    answer = gets.chomp

    case answer
    when '1'
      puts 'Все станции маршрута:'
      routes[i].stations.each { |station| puts station.name }
    when '2'
      stations.each do |station|
        puts "Нажмите #{stations.index(station)}, что бы добавить станцию #{station.name} в маршрут"
      end
      station_i = gets.chomp.to_i
      routes[i].add_station(stations[station_i])
    when '3'
      stations.each do |station|
        puts "Нажмите #{stations.index(station)}, что бы удалить станцию #{station.name} в маршрут"
      end
      station_i = gets.chomp.to_i
      routes[i].remove_station(stations[station_i])
    else
      puts 'Выбирите корректный пункт из меню'
    end
  end

  private

  def create_route!
    stations.each do |station|
      puts "Что бы выбрать станцию '#{station.name}' для начала маршрута, нажмите #{stations.index(station)}"
    end
    st1_index = gets.chomp.to_i
    stations.each do |station|
      puts "Что бы выбрать станцию '#{station.name}' для конца маршрута, нажмите #{stations.index(station)}"
    end
    st2_index = gets.chomp.to_i
    routes << Route.new(stations[st1_index], stations[st2_index])
    puts "Вы создали маршрут #{routes[-1].stations.first.name} - #{routes[-1].stations.last.name}"
  end
end
