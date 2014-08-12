class Vote < ActiveRecord::Base
  belongs_to :voteable , :polymorphic => true
  belongs_to :user

  def self.check_user(voteable, user_id)
    if voteable.votes.where(:user_id => user_id ).first != nil
      true
    else
      false
    end

  end

  def self.vote_value(voteable, user_id)
    voteable.votes.where(
      :user_id => user_id).
    first.
    vote_value
  end

  def self.calculate_vote(voteable, user, value)
    if self.check_user(voteable, user)
      target_vote = voteable.votes.where(
        :user_id => user).
      first

      target_vote.update_attributes(
        :vote_value => target_vote.vote_value + value)
    else
      voteable.votes.create(
        :user_id=> user, 
        :vote_value => value)
    end

  end

  def self.get_vote(voteable,user_id)
    voteable.votes.where(:user_id => user_id ).first
  end
end
