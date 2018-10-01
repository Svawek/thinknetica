class PassengerTrain < Train
  attr_reader :type
  def initialize(name)
    super
    @type = train_type
  end

  private
  attr_writer :type
  def train_type
    :passenger
  end
end
