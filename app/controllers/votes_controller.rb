class VotesController < ApplicationController

  def create

  end

  def update
    @question = Question.find params[:question_id]
    vote = Vote.find params[:id]
    
    if params[:type] == "upvote"
      upvote vote
    else
      downvote vote
    end

    redirect_to question_path(@question) 
  end


  def upvote vote
    vote.increment! :vote_value 
  end

  def downvote vote
    vote.decrement! :vote_value
  end
end
