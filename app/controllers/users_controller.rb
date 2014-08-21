class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_username params[:id]

    unless @user
      redirect_to root_url
    end
  end 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up."
      redirect_to root_url
    else
      redirect_to :back, :notice => "There was a problem creating your account. Please try again."
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :username)
    end

end
