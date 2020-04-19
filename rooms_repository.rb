require_relative 'room'
require 'csv'

class RoomsRepository
    # attr_reader :next_id

    def initialize(csv_path)
        @csv = csv_path
        @rooms = []
        @next_id = 1
        load_csv
    end

    def add(room)
        room.id = @next_id
        @next_id += 1
        @rooms << room
        save_csv
    end

    def find(id)
        @rooms.map{|room| room.id == id}.first
    end

    private

    def save_csv
        # suppose to save to the csv
    end

    def load_csv
        csv_options = { headers: :first_row, header_converters: :symbol }

        CSV.foreach(@csv, csv_options) do |row|
            row[:id]    = row[:id].to_i          # Convert column to Integer
            row[:capacity] = row[:capacity].to_i
            @rooms << Room.new(row)
        end
        @next_id = @rooms.length + 1
    end
end

# repo = PatientsRepository.new('patients.csv')