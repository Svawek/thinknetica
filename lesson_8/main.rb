require_relative 'instance_counter.rb'
require_relative 'manufacturer.rb'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require 'byebug'

# Main class for manage railway.
class Interface
  attr_reader :stations, :trains, :carriages, :routes
  def initialize
    @stations = []
    @trains = []
    @carriages = []
    @routes = []
  end

  def main_menu
    loop do
      puts 'Нажмите 1 для создания станции'
      puts 'Нажмите 2 для просмотра информации по станции'
      puts 'Нажмите 3 для создания поезда'
      puts 'Нажмите 4 для создания вагона'
      puts 'Нажмите 5 для управленя поездом и вагонами'
      puts 'Нажмите 6 для создания маршрута'
      puts 'Нажмите 7 для управления маршрутом'
      puts 'Нажмите 0 для выхода'

      answer = gets.chomp.to_i
      
      answer_hash = {
        1 => create_station,
        2 => station_information,
        3 => create_train,
        4 => create_carriage,
        5 => manage_train,
        6 => create_route,
        7 => manage_route
      }
      byebug
      case answer
      when 1..7
        answer_hash[answer]
      when 0
        break
      else
        puts 'Выбирите корректный пункт из меню'
      end
    end
  end

  def create_station
    puts 'Введите название станции'
    answer = gets.chomp
    stations << Station.new(answer)
    puts "Вы успешно добавили станцию #{stations.last.name}"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_train
    puts 'Нажмите 1 для создания пассажирского поезда'
    puts 'Нажмите 2 для создания грузового поезда'

    answer = gets.chomp
    case answer
    when '1'
      create_train!('PassengerTrain')
    when '2'
      create_train!('CargoTrain')
    else
      puts 'Выбирите корректный пункт из меню'
    end
  end

  def create_carriage
    puts 'Нажмите 1 для создания пассажирского вагона'
    puts 'Нажмите 2 для создания грузового вагона'

    answer = gets.chomp
    case answer
    when '1'
      create_carriage!('PassengerCarriage')
    when '2'
      create_carriage!('CargoCarriage')
    else
      puts 'Выбирите корректный пункт из меню'
    end
  end

  def create_route
    create_route!
  end

  def manage_train
    trains.each do |train|
      puts "Что бы выбрать поезд №#{train.number}, 
            нажмите #{trains.index(train)}"
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

  def station_information
    stations.each do |station|
      puts "Нажмите #{stations.index(station)}, что бы посмотреть информацию по станции #{station.name} в маршрут"
    end
    i = gets.chomp.to_i
    puts 'На станции стоят следующие поезда:'
    stations[i].trains_list do |train|
      puts "Номер поезда: #{train.number}."
    end
  end

  def error_format
    puts 'Неверный формат или указан 0'
  end

  private

  # private выбран, что уберечь основные методы создания от умышленного изменения. И данный класс не наследуется
  attr_writer :stations, :trains, :carriages, :routes
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

  def create_carriage!(type)
    if type == 'PassengerCarriage'
      puts 'Введите количество посадочных мест'
      seats = gets.chomp
      carriages << PassengerCarriage.new(seats)
    else
      puts 'Введите объем вагона'
      size = gets.chomp
      carriages << CargoCarriage.new(size)
    end
    puts "Вы успешно добавили вагон №#{carriages.last.number}"
  rescue RuntimeError => e
    puts e.message
    retry
  end

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

menu = Interface.new
menu.main_menu
