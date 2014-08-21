class HomeController < ApplicationController
  before_action :require_login
  
  def index
  end

  private

    def require_login
      if current_user

      else
        # flash[:error] = "You must be logged in to access this section"
        redirect_to sessions_new_url
      end
    end
    
end
