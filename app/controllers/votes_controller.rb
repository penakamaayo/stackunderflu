class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    type = params[:voteable_type]

    if type == 'Question'
      @question.votes.create(:user_id => self.current_user.id, :vote_value => params[:vote_value])

    elsif type == 'Answer'
      @answer = Reply.find(params[:answer_id])
      @answer.votes.create(:user_id => self.current_user.id, :vote_value => params[:vote_value])

    else
      @comment = Reply.find(params[:comment_id])
      @comment.votes.create(:user_id => self.current_user.id,:vote_value => params[:vote_value])
    end

    # flash[:notice] = "Done"
    redirect_to question_path(@question)
  end

  def update
    @question = Question.find params[:question_id]
    vote = Vote.find params[:id]
    
    if params[:type] == "upvote"
      upvote(vote)
    else
      downvote(vote)
    end

    redirect_to question_path(@question) 
  end


  def upvote vote
    vote.increment!(:vote_value)  
  end

  def downvote vote
    vote.decrement!(:vote_value)
  end
end
