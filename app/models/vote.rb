class Vote < ActiveRecord::Base
  belongs_to :voteable , :polymorphic => true
  belongs_to :user



  def self.calculate_vote(voteable, user, value)
    if self.check_user(voteable, user)
      target_vote = voteable.votes.where(
        :user_id => user).
      first

      target_vote.update_attributes(
        :vote_count => target_vote.vote_count + count)
    else
      voteable.votes.create(
        :user_id=> user, 
        :vote_count => count)
    end

  end

  def self.get_vote(voteable,user_id)
    voteable.votes.where(:user_id => user_id ).first
  end
end
