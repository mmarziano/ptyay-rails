class Student < ApplicationRecord
    belongs_to :school
    belongs_to :household
    belongs_to :classroom

    
end
