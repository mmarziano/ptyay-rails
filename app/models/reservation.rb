class Reservation < ApplicationRecord
    belongs_to :fundraiser
    belongs_to :user
end
