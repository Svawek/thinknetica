class CargoCarriage
  attr_reader :type
  
  private
  attr_writer :type
  def carriage_type
    :cargo
  end

  def set_type
    self.type = carriage_type
  end
end