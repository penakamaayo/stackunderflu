class CommentsController < ApplicationController
  def new
  end

  def create

    @answer = Reply.find(params[:answer_id])
    @question = @answer.response

    @comment = @answer.comments.create(comment_params)

    # @id = params[:answer_id]

    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js 
    end
  end

  def update
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
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
