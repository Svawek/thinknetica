class CargoCarriage < Carriage
  attr_reader :type
  def initialize(number)
    super
    @type = :cargo
  end
end
