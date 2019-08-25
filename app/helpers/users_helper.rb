module UsersHelper

    def profile_complete?
        current_user && !current_user.school_id.nil?
    end 

    def valid_user?(object)
        logged_in? && object.id == session[:user_id]
      end

    def is_admin?
        if current_user.admin != true 
            flash[:alert] = "Must be an admin to access."
            redirect_to user_path(current_user) 
        end 
    end 
  
end
