class AnswersController < ApplicationController
  def new
  end

  def show
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)  

    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js 
    end
  end

  def update
  end

  def destroy
  end

  private
  def answer_params
    params.require(:reply).permit(:user_id, :body)
  end

end
