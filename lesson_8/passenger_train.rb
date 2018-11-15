# Class to create a passenger train.
# Created from Train class with type added
class PassengerTrain < Train
  attr_reader :type
  def initialize(number)
    super
    @type = :passenger
  end
end
