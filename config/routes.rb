Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :bookings, only: [:create]
  end
  resources :bookings, except: [:create]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# Booking controller
# Navbar -->
# x new is on instrument show page --> Mees put form on show page
# Create map on index page

# booking index -> dashboard --> Prio B
# if dashboard ready --> create edit
# if dashboard ready --> create delete
# show instruments on homepage --> prio B
