class CargoCarriage
  attr_reader :type, :number
  def initialize(number)
    @number = number
    @type = :cargo
  end
end