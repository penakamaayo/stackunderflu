class AddAnswerIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :answer_id, :integer
  end
end
