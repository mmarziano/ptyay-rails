class Household < ApplicationRecord
    belongs_to :school
    has_many :users
    has_many :students
end
