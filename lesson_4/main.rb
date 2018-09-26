require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

class Interface
  attr_accessor :stations
  def initialize
    @stations = []
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

    when "6"

    else
      puts "Выбирите корректный пункт из меню"
      main_menu
    end
  end

  def create_station
    puts "Введите название станции"
    answer = gets.chomp
    i = stations.length
    self.stations[i] = Station.new(answer)
    puts "Вы успешно добавили станцию #{stations[i].name}"
    main_menu
  end

  def create_train
    puts 
  end
end

menu = Interface.new
menu.main_menu