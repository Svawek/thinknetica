module Manufacturer
    def set_manufacturer(name)
        self.manufacturer_name = name
    end

    def view_manufacturer
        self.manufacturer_name
    end

    protected
    attr_accessor :manufacturer_name
end