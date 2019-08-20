module UsersHelper

    def profile_complete?
        current_user && !current_user.school_id.nil?
    end 
end
