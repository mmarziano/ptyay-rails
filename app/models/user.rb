class User < ApplicationRecord
    has_secure_password

    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

    belongs_to :school, optional: true
    belongs_to :household, optional: true
    has_many :fundraisers


    def full_name 
        self.first_name.capitalize + " " + self.last_name.capitalize
    end 
end
