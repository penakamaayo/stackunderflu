class Answer < ActiveRecord::Base
  belongs_to :response, :polymorphic => true
  belongs_to :user
  has_many :comments, :dependent => :destroy, :as => :response
end
