class PassengerCarriage
  attr_reader :type, :number
  def initialize(number)
    @number = number
  end
  
  private
  attr_writer :type
  def carriage_type
    :passenger
  end

  def set_type
    self.type = carriage_type
  end
end