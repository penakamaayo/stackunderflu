class Reply < ActiveRecord::Base
 belongs_to :response, :polymorphic => true
 belongs_to :user
 has_many :comments, :class_name => "Reply", :dependent => :destroy, :as => :response
end
