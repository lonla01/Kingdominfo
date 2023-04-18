class RemoveOrganizerColumnFromEvent < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :organizer
  end
end
