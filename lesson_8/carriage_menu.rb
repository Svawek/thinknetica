# Module for manage carriage in menu
module CarriageMenu
  def create_carriage
    puts 'Нажмите 1 для создания пассажирского вагона'
    puts 'Нажмите 2 для создания грузового вагона'

    answer = gets.chomp
    case answer
    when '1' then create_carriage!('PassengerCarriage')
    when '2' then create_carriage!('CargoCarriage')
    else
      puts 'Выбирите корректный пункт из меню'
    end
  end

  private

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
end
