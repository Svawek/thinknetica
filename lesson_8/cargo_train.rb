# Class to create a cargo train.
# Created from Train class with type added
class CargoTrain < Train
  attr_reader :type
  def initialize(number)
    super
    @type = :cargo
  end
end
