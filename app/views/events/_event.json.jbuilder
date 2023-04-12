json.extract! event, :id, :photo_file_name, :organizer, :phone_number, :title, :event_type, :date_time, :description, :participant_count, :address, :directions, :created_at, :updated_at
json.url event_url(event, format: :json)
