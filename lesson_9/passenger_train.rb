# Class to create a passenger train.
# Created from Train class with type added
class PassengerTrain < Train
  include Validation
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  attr_reader :type
  def initialize(number)
    super
    @type = :passenger
  end
end
