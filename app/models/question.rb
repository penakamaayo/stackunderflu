class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :class_name => "Reply", :dependent => :destroy, :as => :response
  has_many :votes, :as => :voteable

  def total_votes
    self.votes.sum(&:vote_count)
  end

  def user_vote(current_user)
    vote_instance  = self.votes.where(
      :user_id => current_user).first
    if vote_instance != nil
      vote_instance.vote_count
    else
      0
    end
  end
end
