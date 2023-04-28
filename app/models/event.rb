class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"

    def date
        date_time.strftime("%a %d %b") unless date_time.nil?
    end

    def time
        date_time.strftime("%H:%M") unless date_time.nil?
    end

    def event_organizer
        organizer.pseudo
    end

end
