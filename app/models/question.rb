class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :class_name => "Reply", :dependent => :destroy, :as => :repliable
  has_many :votes, :as => :voteable, :dependent => :destroy

  include Voteable
end
