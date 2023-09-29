class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    has_many :event_registrations, class_name: "Registration"
    has_many :bookings
    has_many :users, through: :bookings
    has_one_attached :pict_file_name, dependent: :destroy

    def date
        date_time.strftime("%a %d %b") unless date_time.nil?
    end

    def date=(d_)
        d = d_.to_date
        if date_time.nil?
            t = Time.new
        else
            t = date_time.to_time
        end
        p "Setting date d=#{d}, t=#{t}"
        set_date_and_time(d, t)
    end

    def time
        date_time.strftime("%H:%M") unless date_time.nil?
    end

    def time=(t_)
        t = t_.to_time
        if date_time.nil?
            d = Date.new
        else
            d = date_time.to_date
        end
        set_date_and_time(d, t)
    end

    def set_date_and_time(d, t)
        if t.nil?
           t = Time.new
        end
        self.date_time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    end

    def event_organizer
        organizer.pseudo
    end

    def booking_count
        bookings.count
    end

end
