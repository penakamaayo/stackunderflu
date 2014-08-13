class Reply < ActiveRecord::Base
  belongs_to :repliable, :polymorphic => true
  belongs_to :user
  belongs_to :answers, :class_name => "Reply"
  has_many :comments, :foreign_key => "answer_id", :class_name => "Reply", :dependent => :destroy, :as => :repliable
  has_many :votes, :as => :voteable, :dependent => :destroy

  def total_votes
    sum = 0
    self.votes.each do |vote|
      sum = sum + vote.vote_value
    end
    sum
  end

  def users_existing_vote(current_user)
    user_vote = self.votes.where(:user_id => current_user.id,:voteable_type => "Reply").first

    if user_vote
      user_vote.vote_value   
    else
      0
    end
  end
end
