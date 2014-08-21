class RepliesController < ApplicationController
  def new
  end

  def show
    @question = Question.find(params[:id])
    @answers =@question.answers
  end

  def create
    if params[:reply_id]
      @question = Question.find(params[:question_id])
      @answer = Reply.find(params[:reply_id])
      @comment = @answer.comments.create(comment_params)
      @id = params[:reply_id]

      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js 
      end
    else
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(reply_params)  

      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js 
      end
    end
  end

  def destroy
  end

  private
    def reply_params
      params.require(:reply).permit(:user_id, :body)
    end

    def comment_params
      params.require(:reply).permit(:user_id, :body, :reply_id)
    end
    
end
