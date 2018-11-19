<<<<<<< HEAD
=======
# Class to create a cargo train.
# Created from Train class with type added
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
class CargoTrain < Train
  attr_reader :type
  def initialize(number)
    super
    @type = :cargo
  end
end
