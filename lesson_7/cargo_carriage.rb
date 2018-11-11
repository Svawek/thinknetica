class CargoCarriage < Carriage
  attr_reader :type, :size, :goods
  def initialize(size)
    super
    @type = :cargo
    @size = size.to_f
    @goods = 0
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def add_cargo(cargo)
    (self.goods + cargo) < self.size ? self.goods += cargo : error_free_size
  end

  def error_free_size
    puts "Нет такого количества свободного места"
  end

  private
  attr_writer :size, :goods

  def validate!
    raise "Не корректно задан объем или указан 0" if self.size.to_f.zero?
  end
end
