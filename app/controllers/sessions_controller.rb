class SessionsController < ApplicationController

    def index
        @user = User.new
    end

    def new
        @user=User.new
    end 

    def create
        @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                log_in(@user)
                redirect_to user_path(@user)
            else 
                redirect_to signup_path
            end
    end 


    def destroy 
        session[:user_id] = nil

        redirect_to '/'
    end 
end
