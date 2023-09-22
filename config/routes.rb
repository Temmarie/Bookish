Rails.application.routes.draw do

  resources :rooms do
    resources :messages
  end
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'user/:id', to: 'users#show', as: 'user'

  get 'home/chats' => 'home#chats'

end