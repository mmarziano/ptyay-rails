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

end
