class User < ApplicationRecord
    has_secure_password
    
    belongs_to :school, optional: true
    belongs_to :household, optional: true
    has_many :fundraisers

    
end
