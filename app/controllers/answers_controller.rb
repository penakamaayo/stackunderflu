class AnswersController < ApplicationController
  def index
  end

  def show
  end
  
  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)  
    @answers =@question.answers

    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js 
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end
  
  private
  
    def answer_params
      params.require(:reply).permit(:user_id, :body)
    end

end
