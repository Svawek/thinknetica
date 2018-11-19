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
  rescue StandardError
    false
  end

  def add_cargo(cargo)
    (goods + cargo) < size ? self.goods += cargo : error_free_size
  end

  def error_free_size
    puts 'Нет такого количества свободного места'
  end

  private

  attr_writer :size, :goods

  def validate!
    raise 'Не корректно задан объем или указан 0' if size.to_f.zero?
  end
end
