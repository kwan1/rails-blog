class House
    @@count = 0

    def self.count
        @@count
    end

    def self.count_report
        "There are #{count} of instances of the #{name} class"
    end

    attr_accessor :color, :size

    def initialize(color, size)
        @color = color
        @size = size
        @@count += 1
    end

    def details
        "This house is #{color} and #{size}"
    end
end
puts House.count_report
puts House.count
house = House.new("blue", "big")
puts house.details
puts House.count

