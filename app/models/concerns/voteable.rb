module Voteable
  extend ActiveSupport::Concern
  def total_votes
    sum = 0
    self.votes.each do |vote|
      sum += vote.vote_value
    end
    sum
  end
  
  def upvoted_by? current_user
    self.votes.where(:user_id => current_user.id).first.vote_value == 1
  end

  def downvoted_by? current_user
    self.votes.where(:user_id => current_user.id).first.vote_value == -1
  end
end
