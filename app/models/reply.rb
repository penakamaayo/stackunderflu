class Reply < ActiveRecord::Base
  belongs_to :repliable, :polymorphic => true
  belongs_to :user
  belongs_to :answers, :class_name => "Reply"
  has_many :comments, :foreign_key => "answer_id", :class_name => "Reply", :dependent => :destroy, :as => :repliable
  has_many :votes, :as => :voteable, :dependent => :destroy
  
  include Voteable

  def date_posted
    " "<<created_at.to_formatted_s(:short)
  end
end
