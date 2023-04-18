class AddOrganizerIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :organizer_id, :integer
    add_index :events, :organizer_id
  end
end
