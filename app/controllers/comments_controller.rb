class CommentsController < ApplicationController
  def new
  end

  def create
    @answer = Reply.find(params[:answer_id])

    @comment = @answer.comments.create(comment_params)

    @id = params[:reply_id]

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

  def comment_params
    params.require(:reply).permit(:user_id, :body, :answer_id)
  end
end
