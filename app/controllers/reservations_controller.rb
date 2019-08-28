class ReservationsController < ApplicationController
    layout "main"

    before_action :belongs_to_school?, only: [:show, :edit, :update, :destroy]
    before_action :belongs_to_household?, only: [:show, :edit, :update, :destroy]


    def new 
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
        if !current_user.household.students.empty? && Fundraiser.belongs_to_school?(current_user)
            @reservation = Reservation.new    
            @household = current_user.household
        else 
            flash[:alert] = "Must belong to school and have students added to your household before making a reservation."
            redirect_to user_path(current_user)
        end
    end 

    def create
        @fundraiser = Fundraiser.find(params[:reservation][:fundraiser_id])
        if Fundraiser.belongs_to_school?(current_user)
            @reservation = Reservation.new(fundraiser_id: params[:reservation][:fundraiser_id], household_id: current_user.household_id, number_attending: params[:reservation][:number_attending])
            @household = current_user.household
            params[:reservation][:id].reject!{|id| id == ""}
            students = []
            params[:reservation][:id].each do |p|
                student = Student.find(p)
                students << student 
            end 
            @reservation.attendees = students
            if @reservation.save
                redirect_to reservation_path(@reservation)
            else 
                @reservation.errors.full_messages.inspect
                render :edit
            end
        else 
            flash[:alert] = "Must belong to correct school to continue."
            redirect_to user_path(current_user)
        end 
    end 

    def edit 
        @reservation = Reservation.find(params[:id])
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
        @household = current_user.household
    end 

    def update 
        @reservation = Reservation.find(params[:id])
        @reservation.update(fundraiser_id: params[:reservation][:fundraiser_id], household_id: current_user.household_id, number_attending: params[:reservation][:number_attending])
        @fundraiser = Fundraiser.find(params[:reservation][:fundraiser_id])
        @household = current_user.household
        params[:reservation][:id].reject!{|id| id == ""}
        @student = Student.find(params[:reservation][:id])
        @reservation.attendees = @student
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else 
            @reservation.errors.full_messages.inspect

            render :edit
        end
    end 

    def show 
        @reservation = Reservation.find(params[:id])
        @fundraiser = @reservation.fundraiser
        @household = @reservation.household
    end 

    def destroy 
        @reservation = Reservation.find(params[:id])
        @reservation.destroy

        redirect_to user_path(current_user)
    end 

    private 
        def reservation_params
            params.require(:reservation).permit(:fundraiser_id, :number_attending, :id)
        end 

end
