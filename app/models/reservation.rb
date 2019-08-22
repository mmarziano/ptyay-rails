class Reservation < ApplicationRecord
    serialize :attendees
    
    belongs_to :fundraiser
    belongs_to :user
end
