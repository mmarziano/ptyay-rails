module ReservationsHelper

    def belongs_to_household?
        @reservation = Reservation.find(params[:id])
        if @reservation.household != current_user.household
            flash[:alert] = "Cannot access another user's reservation."
            redirect_to user_path(current_user)
        end 
    end  

    def belongs_to_school?
        @reservation = Reservation.find(params[:id])
        if @reservation.household.school_id != current_user.school_id
            flash[:alert] = "Must belong to school to continue."
            redirect_to user_path(current_user)
        end 
    end  
end
