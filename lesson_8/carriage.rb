# The class is created as the basis for the creation of carriages
class Carriage
  include Manufacturer
  def self.init
    @@init = 0
  end

  attr_reader :number
  def initialize(_num)
    @@init += 1
    @number = @@init
  end

  protected

  attr_writer :number
end
