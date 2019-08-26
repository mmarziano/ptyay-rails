class Fundraiser < ApplicationRecord
    belongs_to :school
    has_many :users
    has_many :comments
    has_many :reservations

    def fundraiser_info(attribute) 
        if self.send(attribute).nil?
            "None specified"
        else 
           self.send(attribute)
        end
    end 

    def format_date
        if self.date.nil?
            "None specified"
        else
            self.date.strftime("%m/%d/%Y")
        end 
    end 

    
end
