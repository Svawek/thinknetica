# Module create new modified accessors
module Accessors
  def self.included(base)
    base.extend ClassMethods
    #base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |arg|
        var_name = "@#{arg}".to_sym
        history_name = "@history_#{arg}".to_sym

        define_method(arg) { instance_variable_get(var_name) }
        define_method(history_name) { instance_variable_get(history_name) }
        define_method("#{arg}=".to_sym) do |value| 
          instance_variable_set(var_name, value) 
          instance_variable_get(history_name) << value
          #instance_variable_get("@#{arg}_change_history".to_sym) << value  
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

  # module InstanceMethods
  #   def var_history(var)
  #     var_name = "@#{var}_change_history".to_sym
  #     define_method("#{var}_history".to_sym) { instance_variable_set(var_name, []) }
  #   end
  # end
end
