class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      # flash[:notice] = "You've been logged in."
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Successfully logged in!"
    else
      redirect_to sessions_new_path, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You've been logged out successfully."
  end
end
