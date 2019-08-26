module HouseholdsHelper
    def my_household?
        @household = Household.find(params[:id])
        if !@household.users.include?(current_user)  
            flash[:alert] = "Cannot view another user's household information."
            redirect_to user_path(current_user)
        end 
    end 
end
