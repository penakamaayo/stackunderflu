class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])

    voteable = @question

    voteable.votes.create(:user_id => self.current_user.id, :vote_count => params[:vote_count])

    @vid = voteable.id

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
      @question = @answer.response
      @vid = @answer.id
    end
    vote.destroy

    respond_to do |format|
      format.html { redirect_to(questions_path) }
      format.js 
    end
  end
end
