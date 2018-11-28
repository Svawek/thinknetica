# Module create new modified accessors
module Accessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |arg|
        self.class.arg = []
        var_name = "@#{arg}".to_sym
        define_method(arg) { instance_variable_get(var_name) }
        define_method("#{arg}=".to_sym) do |value| 
          instance_variable_set(var_name, value) 
          self.class.arg << value  
        end
      end
    end

    def strong_attr_accessor
      # https://stackoverflow.com/questions/13664874/dynamically-defining-instance-methods-but-not-class-methods
    end
  end

  module InstanceMethods

  end
end
