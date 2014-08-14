class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :create_path

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def create_path(voteable,user_id,question_id)
    @question = Question.find(question_id)

    voteable.votes.create(:user_id => user_id, :vote_value => 0)

    flash[:notice] = "Done"
    redirect_to question_path(@question)
  end
end
