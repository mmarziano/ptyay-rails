module UsersHelper

    def profile_complete?
        current_user && !current_user.school_id.nil?
    end 

    def valid_user?(object)
        logged_in? && object.user_id == session[:user_id]
    end

    def is_admin?
        if current_user.admin != true  
            flash[:alert] = "Must have admin rights to access."
            redirect_to user_path(current_user) 
        end 
    end 

    def my_student?
        @student = Student.find(params[:id])
        if !current_user.household.students.include?(@student)
          flash[:alert] = "Cannot edit this student."
          redirect_to user_path(current_user)
        end
    end 
  
end
