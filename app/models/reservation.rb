require_dependency "student" 

class Reservation < ApplicationRecord
    serialize :attendees, Array
    
    belongs_to :fundraiser
    belongs_to :household
end
