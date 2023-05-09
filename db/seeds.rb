# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'

class Seed
                    
  def self.host
    @@host
  end

  def self.port
    @@port
  end

  def self.seed_events_filename
    Rails.root.join('db', 'seed_events.json')
  end

  def self.seed_users_filename
    Rails.root.join('db', 'seed_users.json')
  end

  def self.seed_initial_events
    puts 'Seeding initial events'
    inital_events = []
    users = Seed.seed_initial_users
    user_index = 0
    
    # Opening the json file to read the data
    json_file = File.open Seed.seed_events_filename
 
    # Reading the data from the json file
    initial_event_json_array = JSON.load json_file
    
    initial_event_json_array.each do |event_hash|
        event = Event.create(event_hash)
        event.organizer = users[user_index]
        event.date_time = event.date_time.to_time
        user_index += 1
        inital_events << event
        event.save
    end

    puts "Event count == #{inital_events.size}"
  end

  def self.seed_initial_users

    puts 'Seeding initial users'
    initial_users = []
    
    # Opening the json file to read the data
    json_file = File.open Seed.seed_users_filename
 
    # Reading the data from the json file
    initial_user_json_array = JSON.load json_file
    
    initial_user_json_array.each do |user_hash|
        user = User.create(user_hash)
        initial_users << user
        user.save
    end

    puts "User count == #{initial_users.size}"

    initial_users
  end
end

Event.delete_all
User.delete_all
Rake.application["db:fixtures:load"].invoke
#Seed.seed_initial_events