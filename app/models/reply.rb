class Reply < ActiveRecord::Base
  belongs_to :repliable, :polymorphic => true
  belongs_to :user
  belongs_to :answers, :class_name => "Reply"
  has_many :comments, :foreign_key => "answer_id", :class_name => "Reply", :dependent => :destroy, :as => :repliable
  has_many :votes, :as => :voteable, :dependent => :destroy
  
  include Voteable
end
