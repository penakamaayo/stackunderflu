class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.integer :answer_id
      t.references :user
      t.references :repliable, polymorphic: true
      t.timestamps
    end
  end
end
