# Class creatr passenger carriage.
# Class can add passenger and dispaly free seats
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

  def validate_err
    puts 'Не корректно задано количество мест или указано 0 мест'
  end

  private

  attr_writer :seats, :passengers

  def validate!
    raise validate_err if seats.to_i.zero?
  end
end
