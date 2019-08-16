class School < ApplicationRecord
    has_many :households
    has_many :users, through: :households
    has_many :fundraisers
    has_many :classrooms
    has_many :students, through: :classrooms


    def self.total
        self.all.count
    end 
end
