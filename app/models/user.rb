class User < ApplicationRecord
    has_secure_password

    belongs_to :school
    belongs_to :household
    has_many :fundraisers
end
