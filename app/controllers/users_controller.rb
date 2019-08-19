class UsersController < ApplicationController
    layout "main"
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    
    def index
    end 

    def new
        @user = User.new
    end 

    def create 
        byebug
        if @user = User.find_by(email: params[:email]) 
            flash[:message] = "Account found. Please login in."
            redirect_to '/'
        else
            @user = User.create(user_params)
            @household = @user.build_household(school_id: params[:user][:school_id])
                if @user.save 
                    log_in(@user)
                    render :show
                else 
                    @user.errors.full_messages.inspect
                    render :new
                end  
            end
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def edit 
        @user = User.find(params[:id])

    end

    def update 
        @user = User.update(user_params)

        redirect_to user_path(@user)
    end 

     

private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :school_id, :household_id, :profile_img, :household => [:students_attributes => [:first_name, :last_name, :grade]])
    end 

    def require_login
        unless logged_in?
          redirect_to '/'
        end
    end


end
