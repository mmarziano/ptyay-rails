class Household < ApplicationRecord
    belongs_to :school
    has_many :users
    has_many :students
    has_many :reservations

    accepts_nested_attributes_for :students, reject_if: :all_blank

  

end
