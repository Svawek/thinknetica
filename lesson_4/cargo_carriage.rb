class CargoCarriage
  attr_reader :type, :number
  def initialize(number)
    @number = number
    @type = carriage_type
  end

  private
  attr_writer :type
  def carriage_type
    :cargo
  end
end