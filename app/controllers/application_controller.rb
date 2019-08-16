class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    include SchoolsHelper
    include StudentsHelper
    
    def index 
        render 'sessions/index'
    end 
end
