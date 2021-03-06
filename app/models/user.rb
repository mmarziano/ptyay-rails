class User < ApplicationRecord
  has_secure_password 

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  validates :first_name, length: {minimum: 3}

  belongs_to :school, optional: true
  belongs_to :household, optional: true
  has_many :fundraisers
  has_many :comments, through: :fundraisers
  has_many :students

  accepts_nested_attributes_for :household
  
     
    def full_name 
        self.first_name.capitalize + " " + self.last_name.capitalize
    end 

    def rsvpd(fundraiser)
      self.household.reservations.select do |r|
        r.fundraiser_id == fundraiser.id 
      end 
    end 

    def count_me_in?
      !self.household.reservations.empty?
    end 

    def admin?
      self.admin == true
    end 

    def valid_user?(object)
      logged_in? && object.user_id == session[:user_id]
    end

    def my_reservation(fundraiser)
      self.household.reservations.detect do |r|
        r.fundraiser_id == fundraiser.id
      end
    end 

    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.password = SecureRandom.hex
      end
    end

end
