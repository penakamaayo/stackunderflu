class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @answer = Reply.find(params[:answer_id])
    @question = @answer.repliable

    @aid = params[:answer_id]

    @comment = @answer.comments.create(comment_params)
    @comments = @answer.comments

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
    @answer = Reply.find(params[:id])
    @comments = @answer.comments
    
    @answer.destroy
    
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:reply).permit(:user_id, :body, :answer_id)
  end
end
