module Voteable
  extend ActiveSupport::Concern
  def total_votes
    # self.votes.inject(0){ |sum, vote| sum += vote.vote_value }
    sum = 0
    self.votes.each do |vote|
      if vote.vote_value == 1 || vote.vote_value == 0 || vote.vote_value == -1
        sum += vote.vote_value
      elsif vote.vote_value > 1
        sum += 1
      else
        sum += -1
      end
    end
    sum
  end

  def upvoted_by? current_user
    self.votes.where(:user_id => current_user.id).first.vote_value >= 1
  end

  def downvoted_by? current_user
    self.votes.where(:user_id => current_user.id).first.vote_value <= -1
  end
end
