class VotesController < ApplicationController
  def create
    type = params[:voteable_type]

    if type == 'Question'
      @question = Question.find(params[:question_id])
      voteable = @question
      voteable.votes.create(:user_id => self.current_user.id, :vote_value => params[:vote_value])
      flash[:notice] = "Done"

      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end

    elsif type == 'Answer'
      @question = Question.find(params[:question_id])
      @answer = Reply.find(params[:answer_id])

      @answer.votes.create(:user_id => self.current_user.id, :vote_value => params[:vote_value])

      flash[:notice] = "Done"

      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end

    else
      @question = Question.find(params[:question_id])
      @comment = Reply.find(params[:comment_id])

      @comment.votes.create(:user_id => self.current_user.id,:vote_value => params[:vote_value])

      flash[:notice] = "Done"

      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    vote = Vote.find(params[:id])
    
    respond_to do |format|
      format.html { redirect_to(question_path(@question)) }
      format.js 
    end
    vote.destroy
  end
end
