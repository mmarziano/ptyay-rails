class UsersController < ApplicationController
    layout "main"
    
    def index
    end 

    def new
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save 
            log_in(@user)
            redirect_to @user
        else 
            @user.errors.full_messages.inspect
            render :new
        end 
    end 


private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :school_id, :household_id, :profile_img)
    end 
end
