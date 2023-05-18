Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :bookings
    devise_for :users
    resources :events
    get 'home/index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    root "events#index"

    # When a user register to participate to an event
    get 'events/register/:id' => 'events#register', :as => :register_to_event
  end
end
