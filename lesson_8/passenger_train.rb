<<<<<<< HEAD
=======
# Class to create a passenger train.
# Created from Train class with type added
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
class PassengerTrain < Train
  attr_reader :type
  def initialize(number)
    super
    @type = :passenger
  end
end
