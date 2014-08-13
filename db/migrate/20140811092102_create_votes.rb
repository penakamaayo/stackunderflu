class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_value
      t.integer :user_id
      t.integer :voteable_id
      t.string :voteable_type

      t.timestamps
    end
  end
end
