class ReservationsController < ApplicationController
    layout "main"

    def new 
        @reservation = Reservation.new
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
    end 

    def create
        raise params.inspect
    end 

    private 
        def reservation_params
            
        end 

end
