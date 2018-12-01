# Module create new modified accessors
module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  # Create attr methods with history
  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |arg|
        var_name = "@#{arg}".to_sym
        history_name = "@history_#{arg}".to_sym
        define_method(arg) { instance_variable_get(var_name) }
        define_method("#{arg}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          unless instance_variable_get(history_name)
            instance_variable_set(history_name, [])
          end
          instance_variable_get(history_name).push(value)
        end
        define_method("#{arg}_history") { instance_variable_get(history_name) }
      end
    end

    def strong_attr_accessor(attribute, type)
      define_method(attribute) { instance_variable_get(attribute) }
      define_method("#{attribute}=".to_sym) do |value|
        raise ArgumentError, 'Не верный класс значения' unless value.is_a?(type)

        instance_variable_set(var_name, value)
      end
    end
  end
end
