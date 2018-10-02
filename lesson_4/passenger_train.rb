class PassengerTrain < Train
  attr_reader :type
  def initialize(name)
    super
    @type = train_type
  end

  private
  #класс не наследуется. определяем константу в нем
  def train_type
    :passenger
  end
end
