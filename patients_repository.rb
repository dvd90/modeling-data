require_relative 'patient'
require 'csv'

class PatientsRepository
    # attr_reader :next_id

    def initialize(csv_path, room_repo)
        @room_repo = room_repo
        @csv = csv_path
        @patients = []
        @next_id = 1
        load_csv
    end

    def add(patient)
        patient.id = @next_id
        @next_id += 1
        @patients << patient
        save_csv
    end

    private

    def save_csv
        # suppose to save to the csv
    end

    def load_csv
        csv_options = { headers: :first_row, header_converters: :symbol }

        CSV.foreach(@csv, csv_options) do |row|
            row[:id]    = row[:id].to_i          # Convert column to Integer
            row[:cured] = row[:cured] == "true"  # Convert column to boolean
            row[:room_id]    = row[:room_id].to_i          # Convert column to Integer

            new_patient = Patient.new(row)
            new_patient.room = @room_repo.find(row[:room_id])

            @patients << new_patient
        end
        @next_id = @patients.length + 1
    end
end

# repo = PatientsRepository.new('patients.csv')