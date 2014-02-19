class CreateQuestions < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.text :sl_no
      t.string :question
      t.text :option_a
      t.text :option_b
      t.text :option_c
      t.timestamps
    end
  end
end
