class Classroom < ApplicationRecord
    has_many :students
    belongs_to :school

    def self.school_classrooms(school)
        Classroom.where(school_id: school.id)
    end
end
