<<<<<<< HEAD
=======
# Module counts the number of classes created
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

<<<<<<< HEAD
=======
  # Class methods
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
  module ClassMethods
    attr_accessor :instances
  end

<<<<<<< HEAD
=======
  #Instance methods
>>>>>>> 4308b297e531d738d7c11bbbfca6a8381f81ff3c
  module InstanceMethods
    private

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
