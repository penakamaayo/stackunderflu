class AnswersController < ApplicationController
  def new
  end

  def create
    @question = Question.find(params[:question_id])
    params[:user_id] = self.current_user.id
    @answer = @question.answers.create(answer_params)

    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js 
    end
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:user_id, :body)
  end
end
