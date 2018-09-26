class CargoCarriage
  attr_reader :type, :number
  def initialize(number)
    @number = number
  end

  private
  attr_writer :type
  def carriage_type
    :cargo
  end

  def set_type
    self.type = carriage_type
  end
end