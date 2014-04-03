class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :option
      t.string :time_taken

      t.timestamps
    end
  end
end
