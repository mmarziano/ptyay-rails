class Student < ApplicationRecord
    belongs_to :school
    belongs_to :household
    belongs_to :classroom, optional: true
    has_many :reservations

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

    def badge
          if self.participation_points_by_student > 0
            "/assets/bronze_badge.png"
          elsif self.participation_points_by_student > 5
            "/assets/silver_badge.png"
          elsif self.participation_points_by_student > 10
            "/assets/gold_badge.png"
          else 
            "/assets/starter_badge.png"
          end 
    end
    
end

