class StudentsController < ApplicationController
    layout "main"

    def new
        @household = current_user.household
        @student = Student.new
    end 

    def create
        if @student = Student.find_by(student_params) 
            flash[:message] = "Student already exists."
            redirect_to user_path(current_user)
        else
            @student = Student.new(student_params)
            @student.household = Household.find(params[:household_id])
            @student.school = current_user.school

                if @student.save 
                    render "users/show"
                else 
                    @student.errors.full_messages.inspect
                    render :new
                end  
        end
    end

    def edit 
        @student = Student.find(params[:id])
        @household = @student.household_id
    end 

    def update 

    end 

    private 

    def student_params 
        params.require(:student).permit(:first_name, :last_name, :grade, :household_id)
    end 

end
