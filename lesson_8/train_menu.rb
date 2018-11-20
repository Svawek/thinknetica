module TrainMenu
  def create_train
    puts 'Нажмите 1 для создания пассажирского поезда'
    puts 'Нажмите 2 для создания грузового поезда'

    answer = gets.chomp
    case answer
    when '1' then create_train!('PassengerTrain')
    when '2' then create_train!('CargoTrain')
    else
      puts 'Выбирите корректный пункт из меню'
    end
  end

  def manage_train
    trains.each do |train|
      puts "Что бы выбрать поезд №#{train.number}, нажмите #{trains.index(train)}"
    end
    i = gets.chomp.to_i

    puts 'Нажмите 1 для добавления вагонов к поезду'
    puts 'Нажмите 2 для отцепления вагонов от поезда'
    puts 'Нажмите 3 для назначения маршрута поезду'
    puts 'Нажмите 4 отправки поезда к следующей станции'
    puts 'Нажмите 5 возврата поезда к предыдущей станции'
    puts 'Нажмите 6, что бы показать все вагоны поезда'
    if trains[i].class == PassengerTrain
      puts 'Нажмите 7, что бы посадить пассажира в вагона'
    else
      puts 'Нажмите 7, что бы добавить груз в вагон'
    end

    answer = gets.chomp

    case answer
    when '1'
      carriages.each do |carriage|
        if carriage.type == trains[i].type
          puts "Что бы выбрать вагон №#{carriage.number}, нажмите #{carriages.index(carriage)}" unless trains[i].carriages.include?(carriage)
        end
      end
      carriage_i = gets.chomp.to_i
      trains[i].carriage_join(carriages[carriage_i])
    when '2'
      carriages.each do |carriage|
        puts "Что бы выбрать вагон №#{carriage.number}, 
              нажмите #{carriages.index(carriage)}"
      end
      carriage_i = gets.chomp.to_i
      trains[i].carriage_disconnect(carriages[carriage_i])
    when '3'
      routes.each do |route|
        puts "Что бы выбрать маршрут #{route.stations.first.name} - #{route.stations.last.name}, нажмите #{routes.index(route)}"
      end
      route_i = gets.chomp.to_i
      trains[i].set_route(routes[route_i])
    when '4'
      trains[i].drive_forward
    when '5'
      trains[i].drive_back
    when '6'
      trains[i].carriages_list do |carriage|
        case carriage.type
        when :passenger
          puts "Номер вагона: #{carriage.number}. Количество занятых мест: #{carriage.passengers}; Количество свободных мест: #{carriage.seats - carriage.passengers}"
        when :cargo
          puts "Номер вагона: #{carriage.number};  Занятый объём: #{carriage.goods}; Свободный объём: #{carriage.size - carriage.goods}"
        end
      end
    when '7'
      if trains[i].class == PassengerTrain
        trains[i].carriages.each do |carriage|
          puts "Что бы выбрать вагон №#{carriage.number}, нажмите #{trains[i].carriages.index(carriage)}"
        end
        carriage_i = gets.chomp.to_i
        trains[i].carriages[carriage_i].add_passenger
      else
        trains[i].carriages.each do |carriage|
          puts "Что бы выбрать вагон №#{carriage.number}, нажмите #{trains[i].carriages.index(carriage)}"
        end
        carriage_i = gets.chomp.to_i
        puts 'Введите количество груза, которое хотите добавить в вагон'
        cargo_amount = gets.chomp.to_i
        if cargo_amount.zero? 
          error_format 
        else 
          trains[i].carriages[carriage_i].add_cargo(cargo_amount)
        end
      end
    else
      puts 'Выбирите корректный пункт из меню'
    end
  end

  private

  def create_train!(type)
    puts 'Введите номер поезда'
    train_number = gets.chomp
    trains << if type == 'PassengerTrain'
                PassengerTrain.new(train_number)
              else
                CargoTrain.new(train_number)
              end
    puts "Вы успешно добавили поезд №#{trains.last.number}"
  rescue RuntimeError => e
    puts e.message
    retry
  end
end