class AddUserIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_id, :integer
    add_column :bookings, :event_id, :integer
    add_index :bookings, :user_id
    add_index :bookings, :event_id
  end
end
