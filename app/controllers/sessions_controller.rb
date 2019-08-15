class SessionsController < ApplicationController

    def index
        @user = User.new
    end

    def new
    end 

    def create
        @user = User.find(params[:email])
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            redirect_to @user
        else 
        flash.now[:message] = "Unable to login."
        render :new
        end
    end 


    def destroy 
        session[:user_id] = nil

        redirect_to '/'
    end 
end
