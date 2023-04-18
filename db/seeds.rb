# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'

class Seed

  @@img_serial_num = 10000
  @@price_index = 0
  @@size_index = 0
  @@desc_index = 0

  ALL_PRICES = [500, 1000, 1500, 2000, 2500, 3_000, 3_500, 4_000, 4_500, 5_000, 8_000, 9_000, 10_000, 12_000, 15_000,
                17_000, 19_000]
  ALL_SIZES_RANGE = 16...43
  ALL_SIZES = ALL_SIZES_RANGE.to_a
  ALL_STOCKS = [0, 2, 5, 10, 20, 25, 30, 35, 40, 50]
  ALL_DESCRIPTIONS = ['Petit Sac Bandoulière Arrondi Femme - Sac à Main Multi-Poches ',
                      'Eyecatch - Aux Femmes Faux Cuir Sac À Main Dames Épaule Sac',
                      'TLBag Sac à Main pour Femme avec Finitions Couleur Or',
                      'Tissé Paille Dames Sac Vintage Écharpe Sac À Main Plage Épaule',
                      'Retro Kiss Lock PU Cuir Chaînes minimaliste Crossbag Sac patchs ',
                      'Sac à Bandoulière pour Femme en Cuir Souple synthétique',
                      'Borsa donna Tracolla Crossbody M Romantica jacquard blu denim',
                      'Femme Mode Rainbow Fleurs Décorées La Paille Fourre-Tout Sac']
  

                    
  def self.host
    @@host
  end

  def self.port
    @@port
  end

  def self.create_article(file_name)
    new_file_name = to_serial_num(file_name)
    category = extract_category(file_name)
    basename = Pathname.new(file_name).basename.to_s
    image_dir = Rails.root.join('public', category.to_s)
    # Create the parent folder if it doesn't exists.
    # FileUtils.mkdir_p Pathname.new(new_file_name).parent.to_s
    # File.rename(file_name, new_file_name)

    puts "Old_file:[#{file_name}] -> New_file:[#{new_file_name}]"
    article = Article.new
    article.name = basename
    article.category = category
    article.price = ALL_PRICES[Random.rand(ALL_PRICES.size)]
    article.size = ALL_SIZES[Random.rand(ALL_SIZES.size)]
    article.description = ALL_DESCRIPTIONS[Random.rand(ALL_DESCRIPTIONS.size)]
    article.stock = ALL_STOCKS[Random.rand(ALL_STOCKS.size)]
    article.img = file_name
    puts "article.img=[#{article.img}]"
    puts "article.img_loc=[#{article.img_loc}]"
    @@price_index += 1
    @@size_index += 1
    @@desc_index += 1
    @@img_serial_num += 1

    article.save
    article
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


    #all_users << create_article(file)
    puts "User count == #{initial_users.size}"

    initial_users
  end
end

Event.delete_all
User.delete_all
Seed.seed_initial_events