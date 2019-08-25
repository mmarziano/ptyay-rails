module ReservationsHelper

    def belongs_to_household?
        @reservation = Reservation.find(params[:id])
        if @reservation.household != current_user.household
            flash[:alert] = "Cannot access another user's reservation."
            redirect_to user_path(current_user)
        end 
    end  
end
