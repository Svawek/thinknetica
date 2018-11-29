# Module to validate data
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, type, *extra_options)
      case type
      when :presence
        raise "Отсутвует значение в #{attr_name}" if attr_name.empty? || attr_name.nil?
      when :format
        raise "Неверный формат #{attr_name}" if attr_name !~ extra_options[0]
      when :type
        raise "Неверный тип #{attr_name}" if attr_name != extra_options[0]
      else
        raise "Неверно задан тип проверки"
      end
    end
  end

  module InstanceMethods
    def validate!(attr_name, type, *extra_options)
      validate(attr_name, type, *extra_options)
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end