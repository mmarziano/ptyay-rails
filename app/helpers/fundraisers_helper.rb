module FundraisersHelper

    def school_year 
        [
          '2019-2020',
          '2020-2021',
          '2021-2022',
          '2022-2023',
        ]
    end 

    def require_admin
      current_user.admin == true
    end 

    def completed?(fundraiser)
      if fundraiser.status == "Completed"
        "Completed!"
      end
    end 

    def school_fundraiser?
      @fundraiser = Fundraiser.find(params[:id])
      if @fundraiser.school_id != current_user.school_id
          flash[:alert] = "Must belong to school to continue."
          redirect_to user_path(current_user)
      end 
  end  

  

end
