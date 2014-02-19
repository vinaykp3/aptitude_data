class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :student_id
      t.integer :question_id
      t.string :option

      t.timestamps
    end
  end
end
