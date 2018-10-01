class CargoTrain < Train
  attr_reader :type
  def initialize(name)
    super
    @type = train_type
  end

  private

  def train_type
    :cargo
  end
end