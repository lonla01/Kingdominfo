class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :photo_file_name
      t.string :organizer
      t.string :phone_number
      t.string :title
      t.string :type
      t.datetime :date_time
      t.string :description
      t.integer :participant_count
      t.string :address
      t.string :directions

      t.timestamps
    end
  end
end
