require_dependency "student" 

class Reservation < ApplicationRecord
    serialize :attendees, Array

    validates_uniqueness_of :household_id, scope: :fundraiser_id, message: "Your household has already RSVP'd.  Please edit your reservation to continue"
    
    belongs_to :fundraiser
    belongs_to :household

    def self.num_attendees(fundraiser)
        attendees_count = 0
        self.all.select do |r|
            if r.fundraiser_id == fundraiser.id
              attendees_count += r.attendees.count
            end
        end
        attendees_count
    end 

    def self.attendees_list(fundraiser)
        @attendees = []
        fundraiser.reservations.each do |r|
                r.attendees.each do |s|
                    @attendees << s 
                end 
            end 
        @attendees
    end 
end
