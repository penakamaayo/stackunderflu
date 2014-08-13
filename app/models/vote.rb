class Vote < ActiveRecord::Base
  belongs_to :voteable , :polymorphic => true
  belongs_to :user

  def self.user_has_voted(voteable,user_id)
    voteable.votes.where(:user_id => user_id ).first
  end
end
