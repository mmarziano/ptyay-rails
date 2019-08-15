class SessionsController < ApplicationController

    def index
        @user = User.new
    end

    def new
    end 

    def create
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            redirect_to @user
        else 
        flash.now[:message] = "Unable to login."
        redirect_to signup_path
        end
    end 


    def destroy 
        session[:user_id] = nil

        redirect_to '/'
    end 
end
