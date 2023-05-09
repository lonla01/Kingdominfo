class AddRegistrationIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :registration_id, :integer
    add_index :users, :registration_id
  end
end
