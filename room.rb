require_relative 'patient'

class Room
    attr_accessor :id
    attr_reader :capacity

    def initialize(attr = {})
        @capacity = attr[:capacity] || 2
        @patients = attr[:patients] || []
    end

    def full?
        @capacity == @patients.length
    end

    def add(patient)
        return puts "room is full" if full?
        # raise StandardError, "Room is full!" if full?

        @patients << patient
        patient.room = self
    end
end

# room_1 = Room.new
# bill = Patient.new(name: "bill")
# bob = Patient.new(name: "bob")
# gary = Patient.new(name: "gary")

# room_1.add(bill)
# room_1.add(bob)
# room_1.add(gary)

# p room_1