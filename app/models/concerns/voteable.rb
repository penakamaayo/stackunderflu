module Voteable
  extend ActiveSupport::Concern
  def total_votes
    sum = 0
    self.votes.each do |vote|
      sum += vote.vote_value
    end
    sum
  end

  def users_existing_vote(current_user)
    user_vote = self.votes.where(:user_id => current_user.id).first

    if user_vote
      user_vote.vote_value   
    else
      0
    end
  end
end
