class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    
    include SessionsHelper
    include SchoolsHelper
    include StudentsHelper
    include UsersHelper
    include FundraisersHelper
    include CommentsHelper
    include ClassroomsHelper
    include ReservationsHelper
    include HouseholdsHelper
    
    def index 
       
    end 

    
end
