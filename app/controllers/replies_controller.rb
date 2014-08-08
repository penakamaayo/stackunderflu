class RepliesController < ApplicationController
  def new
  end

 def create
    @question = Question.find(params[:question_id])
    # params[:user_id] = self.current_user.id
    @answer = @question.answers.create(reply_params)

    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js 
    end
  end

  def destroy
  end

  private
  def reply_params
    params.require(:reply).permit(:user_id, :body)
  end
end
