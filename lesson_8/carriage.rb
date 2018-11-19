<<<<<<< HEAD
class Carriage
  include Manufacturer
  @@init = 0

  attr_reader :number
  def initialize(_i)
=======
# The class is created as the basis for the creation of carriages
class Carriage
  include Manufacturer
  def self.init
    @@init = 0
  end

  attr_reader :number
  def initialize(_num)
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
    @@init += 1
    @number = @@init
  end

  protected

  attr_writer :number
<<<<<<< HEAD
  end
=======
end
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
