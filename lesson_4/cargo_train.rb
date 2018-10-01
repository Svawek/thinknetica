class CargoTrain < Train
  attr_reader :type
  def t_type
    @type = train_type
  end

  private

  def train_type
    :cargo
  end
end