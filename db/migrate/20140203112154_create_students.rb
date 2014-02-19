class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :qualification
      t.integer :age
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
