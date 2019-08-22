class Student < ApplicationRecord
    belongs_to :school
    belongs_to :household
    belongs_to :classroom, optional: true
    has_many :reservations

    def full_name 
        self.first_name.capitalize + " " + self.last_name.capitalize
    end 
end

