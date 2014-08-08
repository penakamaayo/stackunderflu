class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :response_id
      t.string :response_type

      t.timestamps
    end
  end
end
