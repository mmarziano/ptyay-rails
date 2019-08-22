require_dependency "student" 

class Reservation < ApplicationRecord
    serialize :attendees, Array

    validates_uniqueness_of :household_id, scope: :fundraiser_id, message: "Your household has already RSVP'd.  Please edit your reservation to continue"
    
    belongs_to :fundraiser
    belongs_to :household
end
