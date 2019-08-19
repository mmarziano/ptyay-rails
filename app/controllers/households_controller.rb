class HouseholdsController < ApplicationController
    layout "main"
    
    def new
        @household = Household.new
        
    end 

    def create 
        @household = Household.create(school_id: current_user.school_id)
        current_user.household_id = @household.id
        current_user.save
        @student = Student.find_or_create_by(student_params)
        
        redirect_to user_path(current_user)

    end 

    def show 
        @household = Household.find(params[:id])
    end

    private 

        def student_params
            params.require(:household).permit(:student => [:first_name, :last_name, :grade])
        end 

end
