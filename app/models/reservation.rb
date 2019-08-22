class Reservation < ApplicationRecord
    belong_to :fundraiser
    belong_to :user
end
