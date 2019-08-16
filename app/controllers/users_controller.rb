class UsersController < ApplicationController
    layout "main"
    before_action :require_login, only: :show
    
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

    def show 
        @user = User.find(params[:id])
    end 

private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :school_id, :household_id, :profile_img)
    end 

    def require_login
        unless logged_in?
          redirect_to '/'
        end
    end
end
