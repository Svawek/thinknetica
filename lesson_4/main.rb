require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require 'byebug'


class Interface
  attr_accessor :stations, :trains, :carriages, :routes
  def initialize
    @stations = []
    @trains = []
    @carriages = []
    @routes = []
  end
  def main_menu
    puts "Нажмите 1 для создания станции"
    puts "Нажмите 2 для управления станцией"
    puts "Нажмите 3 для создания поезда и вагонов"
    puts "Нажмите 4 для управленя поездом и вагонами"
    puts "Нажмите 5 для создания маршрута"
    puts "Нажмите 6 для управления маршрутом"
    answer = gets.chomp

    case answer
    when "1"
      create_station
    when "2"

    when "3"
      create_train
    when "4"

    when "5"
      create_route
    when "6"

    else
      puts "Выбирите корректный пункт из меню"
      main_menu
    end
  end

  def create_station
    puts "Введите название станции"
    answer = gets.chomp
    self.stations << Station.new(answer)
    puts "Вы успешно добавили станцию #{stations.last.name}"
    main_menu
  end

  def create_train
    puts "Нажмите 1 для создания пассажирского поезда"
    puts "Нажмите 2 для создания грузового поезда"
    puts "Нажмите 3 для создания пассажирского вагона"
    puts "Нажмите 4 для создания грузового вагона"
    puts "Нажмите 0 для возврата в главное меню"
    answer = gets.chomp
    case answer
    when "1"
      add_train(PassengerTrain)
    when "2"
      add_train(CargoTrain)
    when "3"
      add_carriage(PassengerCarriage)
    when "4"
      add_carriage(CargoCarriage)
    when "0"
      main_menu
    else
      puts "Выбирите корректный пункт из меню"
      create_train
    end
  end

  def create_route
    add_route
  end


  def add_train(type)
    puts "Введите номер поезда"
    train_number = gets.chomp
    self.trains << type.new(train_number)
    puts "Вы успешно добавили поезд №#{trains.last.number}"
    create_train
  end

  def add_carriage(type)
    puts "Введите номер вагона"
    carriage_number = gets.chomp
    self.carriages << type.new(carriage_number)
    puts "Вы успешно добавили вагон №#{carriages.last.number}"
    create_train
  end

  def add_route
    puts "Введите станцию начала маршрута"
    route_begin = gets.chomp
    puts "Введите станцию конца маршрута"
    route_end = gets.chomp
    st1 = stations.each {|station| station if station.name == route_begin}
    byebug
    st2 = stations.each {|station| station if station.name == route_end}
    if st1 == nil || st2 == nil
      "Введена не правильная станция"
      add_route
    end
    self.routes << Route.new(st1, st2)
    puts "Вы создали маршрут #{routes[-1].stations[-1].name}"
    main_menu
  end
end

menu = Interface.new
menu.main_menu
