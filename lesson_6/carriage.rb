class Carriage
    include Manufacturer
    CARRIAGE_NUMBER_FORMAT = /^\d+$/
  
    attr_reader :number
    def initialize(number)
      @number = number
      validate!
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private
    def validate!
      raise "Номер вагона не может быть nil" if self.number.nil?
      raise "Неверный формат номера вагона" if self.number !~ CARRIAGE_NUMBER_FORMAT
    end
  end
