class CreateRolesUsers < ActiveRecord::Migration

  def change
    create_table :roles_users, :id => false do |t|
      t.integer :role_id
      t.integer :user_id
      t.timestamps
    end
    add_index :roles_users,[:role_id, :user_id]
  end

end
