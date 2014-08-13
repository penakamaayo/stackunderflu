class Reply < ActiveRecord::Base
 belongs_to :repliable, :polymorphic => true
 belongs_to :user
 belongs_to :answers, :class_name => "Reply"
 has_many :comments, :foreign_key => "answer_id", :class_name => "Reply", :dependent => :destroy, :as => :repliable
 has_many :votes, :as => :voteable, :dependent => :destroy

  def total_votes
    self.votes.sum(&:vote_value)

  end

  def user_vote(current_user)
    vote_instance  = self.votes.where(
        :user_id => current_user).
    first
    if vote_instance != nil
      vote_instance.vote_value
    else
      0
    end
  end
end
