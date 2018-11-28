require_relative 'instance_counter.rb'
require_relative 'manufacturer.rb'
require_relative 'accessors'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'train_menu'
require_relative 'station_menu'
require_relative 'carriage_menu'
require_relative 'route_menu'
require 'byebug'

# Main class for manage railway.
class Interface
  include TrainMenu
  include StationMenu
  include CarriageMenu
  include RouteMenu

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

      answer = gets.chomp

      case answer
      when '1' then create_station
      when '2' then station_information
      when '3' then create_train
      when '4' then create_carriage
      when '5' then manage_train
      when '6' then create_route
      when '7' then manage_route
      when '0' then break
      else
        puts 'Выбирите правильный пункт меню'
      end
    end
  end

  private

  # private is selected to protect the basic creation methods
  # from intentional modification.
  # And this class is not inherited.
  attr_writer :stations, :trains, :carriages, :routes
end

menu = Interface.new
menu.main_menu
