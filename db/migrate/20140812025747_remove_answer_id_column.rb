class RemoveAnswerIdColumn < ActiveRecord::Migration
def self.up
  remove_column :replies, :answer_id
end

def self.down
  add_column :replies, :answer_id, :integer
end
end
