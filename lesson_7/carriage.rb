class Carriage
    include Manufacturer
    @@init = 0
  
    attr_reader :number
    def initialize(i)
      @@init += 1
      @number = @@init
    end

    protected
    attr_writer :number
  end
