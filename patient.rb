class Patient
    attr_reader :name, :blood_type
    attr_accessor :id, :room

    def initialize(attr = {})
        @id = attr[:id]
        @name = attr[:name]
        @cured = attr[:cured] || false
        @blood_type = attr[:blood_type] || "O"
    end

    def cured?
        @cured
    end

    def cure
        @cured = true
    end
end