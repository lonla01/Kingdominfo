class AddRegistrationIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :registration_id, :integer
    add_index :events, :registration_id
  end
end
