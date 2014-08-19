class VotesController < ApplicationController

  def create
  end

  def update
    @question = Question.find params[:question_id]
    vote = Vote.find params[:id]
    @answers =@question.answers

    @answer = @comment = Reply.find vote.voteable_id
    @vid = @answer.id

    if params[:type] == "upvote"
      upvote vote
    else
      downvote vote
    end

    respond_to do |format|
         format.html { redirect_to question_path @question }
         format.js
    end
  end

  private
  def upvote vote
    vote.increment! :vote_value 
  end

  def downvote vote
    vote.decrement! :vote_value
  end
end
