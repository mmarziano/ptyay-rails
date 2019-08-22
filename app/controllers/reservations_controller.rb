class ReservationsController < ApplicationController
    layout "main"
    

    def new 
        @reservation = Reservation.new
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
        @household = current_user.household
    end 

    def create
        @reservation = Reservation.new(fundraiser_id: params[:reservation][:fundraiser_id], household_id: current_user.household_id, number_attending: params[:reservation][:number_attending])
        @fundraiser = Fundraiser.find(params[:reservation][:fundraiser_id])
        @household = current_user.household
        params[:reservation][:id].reject!{|id| id == ""}
        @student = Student.find(params[:reservation][:id])
        @reservation.attendees = @student
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else 
            @reservation.errors.full_messages.inspect
            render :new
        end
    end 

    def show 
        @reservation = Reservation.find(params[:id])
        @fundraiser = @reservation.fundraiser
        @household = @reservation.household
    end 

    private 
        def reservation_params
            params.require(:reservation).permit(:fundraiser_id, :number_attending, :id)
        end 

end
