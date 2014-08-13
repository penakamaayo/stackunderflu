class Vote < ActiveRecord::Base
  belongs_to :voteable , :polymorphic => true
  belongs_to :user

  def self.get_users_vote(voteable,user_id)
    voteable.votes.where(:user_id => user_id ).first
  end
end
