class UsersController < ApplicationController
    layout "main"
   
    
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
            @household = @user.build_household(school_id: params[:user][:school_id])
            byebug
            uploaded_io = params[:person][:picture]
            File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
            end
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
        @household = @user.household
    end 

    def edit 
        @user = User.find(params[:id])

    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        @user.profile_img = "/assets/" + upload
        @household = @user.household
        if @user.save 
            redirect_to user_path(@user)
        else 
            @user.errors.full_messages.inspect
            render :show
        end
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

    def upload
        uploaded_file = current_user.email.to_s + params[:user][:profile_img].original_filename 
        File.open(Rails.root.join('app', 'assets', 'images', 'uploaded_images', uploaded_file), 'wb') do |file|
          file.write(uploaded_file) 
        end
        uploaded_file
    end
end
