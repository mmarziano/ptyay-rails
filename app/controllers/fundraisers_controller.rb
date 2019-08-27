class FundraisersController < ApplicationController
    layout "main"

    before_action :school_fundraiser?, only: [:show, :edit, :update, :destroy]
    before_action :is_admin?, only:  [:index, :new, :create, :edit, :update, :destroy, :ee]

    def index
        @fundraisers = Fundraiser.select {|f| f.school == current_user.school}
        respond_to do |format|
            format.html
            format.xlsx
        end
    end 

    def ee 
        @fundraisers = Fundraiser.exceeded_expectations?.belongs_to_school?(current_user)
    end 

    def new 
        @fundraiser = Fundraiser.new
    end 

    def create
        @fundraiser = Fundraiser.create(fundraiser_params)
        @fundraiser.school = current_user.school
        @fundraiser.status = "Pending"
        if @fundraiser.save
            redirect_to user_path(current_user)
        else 
            @fundraiser.errors.full_messages.inspect
            render :new
        end 
    end

    def show 
        @fundraiser = Fundraiser.find(params[:id])
        @household = current_user.household
        @reservation = Reservation.find_by(fundraiser_id: @fundraiser.id, household_id: @household.id)
    end

    def edit 
        @fundraiser = Fundraiser.find(params[:id])
    end 

    def update
        @fundraiser = Fundraiser.find(params[:id])
        if @fundraiser
            @fundraiser.update(fundraiser_params)
                if params[:fundraiser][:status] == "1"
                    @fundraiser.status = "Completed"
                else 
                    @fundraiser.status = "Pending"
                end
            @fundraiser.save
            redirect_to user_path(current_user)
        else 
            @fundraiser.errors.full_messages.inspect 
            render :new 
        end 
    end 

    def destroy 
        @fundraiser = Fundraiser.find(params[:id])
            @fundraiser.reservations.each do |r|
                r.destroy
            end 
            @fundraiser.comments.each do |c|
                c.destroy
            end 
        @fundraiser.destroy

        redirect_to user_path(current_user)

    end 
    
    private 
        def fundraiser_params
            params.require(:fundraiser).permit(:title, :goal, :date, :description, :price, :amt_raised, :time, :duration, :location, :notice, :school_year, :admin_notes, :status)
        end 
end
