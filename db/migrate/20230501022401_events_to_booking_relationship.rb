class EventsToBookingRelationship < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :bookings
  end
end
