class ClassroomsController < ApplicationController
    layout "main"

    def new 
        @classroom = Classroom.new
    end 

    def create
        raise params.inspect
        @school = current_user.school
        Classroom.create(school_id: @school.id)
    end 
end
