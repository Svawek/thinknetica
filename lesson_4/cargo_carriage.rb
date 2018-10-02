class CargoCarriage
  attr_reader :type, :number
  def initialize(number)
    @number = number
    @type = carriage_type
  end

  private
  #класс не наследуется. определяем константу в нем
  def carriage_type
    :cargo
  end
end