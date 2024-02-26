Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'urls#new'
  resources :urls, only: [:create, :show]
  get ':short_url', to: 'urls#shortened', as: 'shortened_url'
end
