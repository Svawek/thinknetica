class PassengerTrain < Train
  attr_reader :type
  
  private
  attr_writer :type
  def train_type
    :passenger
  end

  def set_type
    self.type = train_type
  end
end
