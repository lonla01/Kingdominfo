class AddBookingsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :bookings, :integer, default: 0
  end
end
