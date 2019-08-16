class UsersController < ApplicationController
    layout "main"
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    
    def index
    end 

    def new
        @user = User.new
    end 

    def create 
        if User.find_by(email: params[:email])
            redirect_to '/'
        else 
            @user = User.create(user_params)
            @schools = School.sort_by_zip(params[:zipcode])
            if @user.save 
                log_in(@user)
                render partial: '/users/select_school'
            else 
                @user.errors.full_messages.inspect
                render :new
            end 
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
