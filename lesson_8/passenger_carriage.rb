<<<<<<< HEAD
=======
# Class creatr passenger carriage. 
# Class can add passenger and dispaly free seats
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
class PassengerCarriage < Carriage
  attr_reader :type, :seats, :passengers
  def initialize(seats)
    super
    @type = :passenger
    @seats = seats.to_i
    @passengers = 0
    validate!
  end

  def add_passenger
    passengers < seats ? self.passengers += 1 : error_free_seats
  end

  def free_seats
    free_places = seats - self.passengers
    num = free_places.digits.last
    if num == 1
      puts "Свободно #{free_places} место."
    elsif num > 1 && num < 5
      puts "Свободно #{free_places} места."
    else
      puts "Свободно #{free_places} мест."
    end
  end

  def error_free_seats
    puts 'Нет свободных мест'
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  attr_writer :seats, :passengers

  def validate!
<<<<<<< HEAD
    raise 'Не корректно задано количество мест или указано 0 мест' if seats.to_i == 0
=======
    if seats.to_i.zero?
      raise 'Не корректно задано количество мест или указано 0 мест'
    end
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
  end
end
