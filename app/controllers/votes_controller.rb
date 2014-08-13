class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])

    voteable = @question

    vote = Vote.where("user_id = ? AND voteable_id = ?", params[:user_id],params[:question_id])

    if vote.count > 0
      flash[:notice] = "You've already voted for this."
    else
      voteable.votes.create(:user_id => self.current_user.id, :vote_value => params[:vote_value])
  
      flash[:notice] = "Vote submitted."

      # @vid = voteable.id
    end

    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    if vote.voteable_type ==  'Question' 
      @question = vote.voteable
    else
      @answer = vote.voteable
      @question = @answer.repliable
      @vid = @answer.id
    end
    vote.destroy

    respond_to do |format|
      format.html { redirect_to(question_path(@question)) }
      format.js 
    end
  end
end
