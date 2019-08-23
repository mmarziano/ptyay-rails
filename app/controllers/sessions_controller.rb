class SessionsController < ApplicationController
    layout "application"
    
    def index
        @user = User.new
    end

    def new
        @user=User.new
    end 

    def create
        @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])&& @user.school_id != nil
                log_in(@user)
                redirect_to user_path(@user)
            elsif @user && @user.authenticate(params[:password])
                redirect_to signup_path(@user)
            else 
                redirect_to new_user_path
            end
    end 


    def destroy 
        session[:user_id] = nil

        redirect_to '/'
    end 

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to home_path
    end

    private
    
    def auth
        request.env['omniauth.auth']
    end
end
