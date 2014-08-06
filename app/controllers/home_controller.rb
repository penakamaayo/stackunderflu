class HomeController < ApplicationController
  def index
    if current_user
      
    else
      redirect_to sessions_new_url
    end
  end
end
