# Class to create a cargo train.
# Created from Train class with type added
class CargoTrain < Train
  include Validation
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  attr_reader :type
  def initialize(number)
    super
    @type = :cargo
  end
end
