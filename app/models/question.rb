class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :destroy, :as => :response
end
