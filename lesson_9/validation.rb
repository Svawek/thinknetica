# Module to validate data
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Module add validate array
  module ClassMethods
    attr_reader :validations

    def validate(attr_name, type, *extra_option)
      @validations ||= []
      val_current = { name: attr_name, type: type, attr: extra_option[0] }
      @validations.push(val_current)
    end
  end

  # Module describe validation
  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:name]}".to_sym)
        send("val_#{validation[:type]}", value, validation[:attr])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def val_presence(attr_name, *_args)
      if attr_name.empty? || attr_name.nil?
        raise "Отсутвует значение в #{attr_name}"
      end
    end

    def val_format(attr_name, *args)
      format = args.first
      raise "Неверный формат #{attr_name}" unless attr_name =~ format
    end

    def val_type(attr_name, *args)
      type = args.first
      raise "Неверный тип #{attr_name}" if attr_name != type
    end
  end
end
