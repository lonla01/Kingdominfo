class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    has_many :event_registrations, class_name: "Registration"

    def date
        date_time.strftime("%a %d %b") unless date_time.nil?
    end

    def time
        date_time.strftime("%H:%M") unless date_time.nil?
    end

    def event_organizer
        organizer.pseudo
    end

    def register_to
        registration = Registration.new
        registration.event = self
        registration.organizer = current_user
        registration.save
    end

end
