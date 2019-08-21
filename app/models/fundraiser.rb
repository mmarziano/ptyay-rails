class Fundraiser < ApplicationRecord
    belongs_to :school
    has_many :users
    has_many :comments
end
