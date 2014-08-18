module Voteable
  extend ActiveSupport::Concern
  def total_votes
    self.votes.inject(0){ |sum, vote| sum += vote.vote_value }
  end

  def upvoted_by? current_user
    self.votes.where(:user_id => current_user.id).first.vote_value >= 1
  end

  def downvoted_by? current_user
    self.votes.where(:user_id => current_user.id).first.vote_value <= -1
  end
end
