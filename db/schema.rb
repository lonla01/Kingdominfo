# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_28_112025) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "photo_file_name"
    t.string "phone_number"
    t.string "title"
    t.string "event_type"
    t.datetime "date_time"
    t.string "description"
    t.integer "participant_count"
    t.string "address"
    t.string "directions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organizer_id"
    t.integer "bookings", default: 0
    t.integer "registration_id"
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
    t.index ["registration_id"], name: "index_events_on_registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "organizer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["organizer_id"], name: "index_registrations_on_organizer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.integer "registration_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["registration_id"], name: "index_users_on_registration_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
