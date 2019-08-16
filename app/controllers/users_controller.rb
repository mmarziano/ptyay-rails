class UsersController < ApplicationController
    layout "main"
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    
    def index
    end 

    def new
        @user = User.new
    end 

    def create 
        if @user = User.find_by(email: params[:email]) 
            flash[:message] = "Account found. Please login in."
            redirect_to '/'
        else 
            @user = User.create(user_params)
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

    def edit 
        @user = User.find(params[:id])
        @user.build_school
        3.times {@user.build_household.students.build}
    end

    def update 
        raise params.inspect
        @user = User.find(current_user.id)
        @user.school_id = params[:school_id]
        @user.save
        byebug
        redirect_to user_path(@user)
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
