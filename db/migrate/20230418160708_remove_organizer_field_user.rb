class RemoveOrganizerFieldUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :organizer
  end
end
