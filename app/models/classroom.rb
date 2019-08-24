class Classroom < ApplicationRecord
    has_many :students
    belongs_to :school

    def self.school_classrooms(school)
        Classroom.where(school_id: school.id)
    end

    def participation_points_by_classroom
        class_points = 0 
        self.students.each do |s|
            class_points += s.participation_points_by_student
        end 
        class_points
    end 
end
