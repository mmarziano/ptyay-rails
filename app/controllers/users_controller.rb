class UsersController < ApplicationController
    layout "main"
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    
    def index
    end 

    def new
        @user = User.new
        @user.build_school
        3.times {@user.build_household.students.build}
    end 

    def create 
        raise params.inspect
        if @user = User.find_by(email: params[:email]) && @user.school_id == nil
            render :new
        else 
            @user = User.create(user_params)
            @schools = School.sort_by_zip(params[:zipcode])
                if @user.save 
                    log_in(@user)
                    render partial: '/users/complete_profile'
                else 
                    raise @user.errors.full_messages.inspect
                    render :new
                end  
            end
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def update 
        raise params.inspect
        @user = User.find(current_user.id)
        @user.school_id = params[:school_id]
        @user.save
        byebug
        redirect_to user_path(@user)
    end 

    def edit 
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
