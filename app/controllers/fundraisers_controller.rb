class FundraisersController < ApplicationController
    layout "main"


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
    end

    def edit 
        @fundraiser = Fundraiser.find(params[:id])
    end 

    def update
        @fundraiser = Fundraiser.find(params[:id])
        if @fundraiser
            @fundraiser.update(fundraiser_params)

            redirect_to user_path(current_user)
        else 
            @fundraiser.errors.full_messages.inspect 
            render :new 
        end 
    end 
    
    private 
        def fundraiser_params
            params.require(:fundraiser).permit(:title, :goal, :date, :description, :price, :time, :duration, :location)
        end 
end
