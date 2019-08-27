class Student < ApplicationRecord
    belongs_to :school
    belongs_to :household
    belongs_to :classroom, optional: true
    has_many :reservations

    #scope :bronze, -> { where(participation_points_by_student > 0)}
    #scope :silver, -> { where(participation_points_by_student > 10) }
    #scope :gold, -> { where(participation_points_by_student > 15) }


    def full_name 
        self.first_name.capitalize + " " + self.last_name.capitalize
    end 

    def participation_points_by_student
       points = 0
       self.household.reservations.each do |r|
            r.attendees.each do |s|
              if s == self
                points += 1 
              end 
            end 
        end 
        points
    end 

    def delete_student_reservations 
      self.household.reservations.each do |r|
        r.attendees.each do |s|
          if self.id == s.id
            s.delete 
          end 
        end 
      end 
    end 
    
end

