class Comment < ApplicationRecord
    belongs_to :fundraiser
    belongs_to :user

    def post_time
        self.created_at.strftime("%m/%d/%y at %I:%M %p")
    end 

    def show_comment
            self.user.first_name + ": " + self.text + " - " + self.post_time 
    end    
    

end
