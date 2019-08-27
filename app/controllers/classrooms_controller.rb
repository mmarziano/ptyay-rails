class ClassroomsController < ApplicationController
    layout "main"

    before_action :is_admin?, only:  [:new, :create, :edit, :update, :destroy]

    def index 
        @classrooms = Classroom.school_classrooms(current_user.school)
    end 

    def new 
        @classroom = Classroom.new
    end 

    def create
        @school = current_user.school
        grades = []
        params[:classroom][:name].reject! { |x| x.empty? }
        params[:classroom][:name].each do |p|
            grades << p
        end 
        grades.each do |g|
            Classroom.create(school_id: @school.id, name: g)
        end
        redirect_to user_path(current_user)
    end 
end
