class CargoTrain < Train
  attr_reader :type
  def initialize(name)
    super
    @type = :cargo
  end
end