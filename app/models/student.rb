class Student < ApplicationRecord
    belongs_to :school
    belongs_to :household
    belongs_to :classroom, optional: true
    has_many :reservations

    def full_name 
        self.first_name.capitalize + " " + self.last_name.capitalize
    end 

    def participation_points_by_student
            school = self.school
            school.fundraisers.each do |f|
                f.reservations.each do |r|
                    r.household.students.select do |s|
                        s.id == self.id
                    end 
                @points = r.household.students.count 
                end 
            end  
        @points    
    end 

    def participation_points_by_classroom(classroom)
         
    end 
end

