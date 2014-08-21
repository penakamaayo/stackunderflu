class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :class_name => "Reply", :dependent => :destroy, :as => :repliable
  has_many :votes, :as => :voteable, :dependent => :destroy
  has_many :question_tags
  has_many :tags, :through => :question_tags

  include Voteable

  def tags_list
    self.tags.map do |tag|
      tag.name
    end.join(", ")
  end

  def tags_list=(tags)
    tag_names = tags.split(",")
    
    self.tags = tag_names.map do |name|
      Tag.where(:name => name).first || Tag.create(:name => name)
    end
  end  
end
