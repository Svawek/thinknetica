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
    loop do
      puts "Нажмите 1 для создания станции"
      puts "Нажмите 3 для создания поезда и вагонов"
      puts "Нажмите 4 для управленя поездом и вагонами"
      puts "Нажмите 5 для создания маршрута"
      puts "Нажмите 6 для управления маршрутом"
      puts "Нажмите 0 для выхода"

    

      answer = gets.chomp

      case answer
      when "1"
        create_station
      when "3"
        create_train
      when "4"
        manage_train
      when "5"
        create_route
      when "6"

      when "0"
        exit
      else
        puts "Выбирите корректный пункт из меню"
      end
    end
  end

  def create_station
    puts "Введите название станции"
    answer = gets.chomp
    self.stations << Station.new(answer)
    puts "Вы успешно добавили станцию #{stations.last.name}"
  end

  def create_train
    puts "Нажмите 1 для создания пассажирского поезда"
    puts "Нажмите 2 для создания грузового поезда"
    puts "Нажмите 3 для создания пассажирского вагона"
    puts "Нажмите 4 для создания грузового вагона"
    answer = gets.chomp
    case answer
    when "1"
      create_train!(PassengerTrain)
    when "2"
      create_train!(CargoTrain)
    when "3"
      create_carriage(PassengerCarriage)
    when "4"
      create_carriage(CargoCarriage)
    else
      puts "Выбирите корректный пункт из меню"
    end
  end

  def create_route
    create_route!
  end

  def manage_train
    trains.each { |train| 
      puts "Что бы выбрать поездд №#{train.number}, нажмите #{trains.index(train)}"
    }
    i = gets.chomp.to_i

    puts "Нажмите 1 для добавления вагонов к поезду"
    puts "Нажмите 2 для отцепления вагонов от поезда"
    puts "Нажмите 3 для назначения маршрута поезду"
    puts "Нажмите 4 отправки поезда к следующей станции"
    puts "Нажмите 5 возврата поезда к предыдущей станции"

    answer = gets.chomp

    case answer
    when "1"
      carriages.each { |carriage| 
        puts "Что бы выбрать вагон №#{carriage.number}, нажмите #{carriages.index(carriage)}"
      }
      carriage_i = gets.chomp.to_i
      trains[i].carriage_increase(carriages[carriage_i])
      byebug
    when "2"
      
    when "3"
      
    when "4"

    when "5"
      
    else
      puts "Выбирите корректный пункт из меню"
    end
  end


  def create_train!(type)
    puts "Введите номер поезда"
    train_number = gets.chomp
    self.trains << type.new(train_number)
    puts "Вы успешно добавили поезд №#{trains.last.number}"
  end

  def create_carriage(type)
    puts "Введите номер вагона"
    carriage_number = gets.chomp
    self.carriages << type.new(carriage_number)
    puts "Вы успешно добавили вагон №#{carriages.last.number}"
  end

  def create_route!
    stations.each { |station|
      puts "Что бы выбрать станцию '#{station.name}' для начала маршрута, нажмите #{stations.index(station)}"
    }
    st1_index = gets.chomp.to_i
    stations.each { |station|
      puts "Что бы выбрать станцию '#{station.name}' для конца маршрута, нажмите #{stations.index(station)}"
    }
    st2_index = gets.chomp.to_i
    self.routes << Route.new(stations[st1_index], stations[st2_index])
    puts "Вы создали маршрут #{routes[-1].stations.first.name} - #{routes[-1].stations.last.name}"
  end

  def add_carriage
    

  end
end

menu = Interface.new
menu.main_menu
