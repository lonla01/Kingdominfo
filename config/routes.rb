Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :bookings
    devise_for :users, controllers: {
           sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    resources :events, except: [:destroy]
    get 'home/index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    root "events#index"

    # When a user register to participate to an event
    get 'events/register/:id' => 'events#register', :as => :register_to_event

    # We need thhis two lines for our delete with a link_to tag to work
    # We use this type of link_to tag in views/events/show.html.erb
    delete 'events/:id/delete' => 'events#destroy', :as => :event_cancel
    get 'events/:id/delete' => 'events#destroy'

  end
end
