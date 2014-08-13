class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :class_name => "Reply", :dependent => :destroy, :as => :repliable
  has_many :votes, :as => :voteable, :dependent => :destroy

  def total_votes
    sum = 0
    self.votes.each do |vote|
      sum = sum + vote.vote_value
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
