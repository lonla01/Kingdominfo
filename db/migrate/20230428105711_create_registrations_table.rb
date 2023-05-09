class CreateRegistrationsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.integer :event_id
      t.integer :organizer_id

      t.timestamps
    end
    add_index :registrations, :event_id
    add_index :registrations, :organizer_id
  end
end
