class Carriage
    include Manufacturer
    CARRIAGE_NUMBER_FORMAT = /^\d+$/
    @@init = 0
  
    attr_reader :number
    def initialize
      @@init += 1
      @number = @@init
      validate!
    end
  end
