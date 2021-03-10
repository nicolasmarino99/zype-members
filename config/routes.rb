Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  root to: 'videos#index'
  get 'videos(/:id)', to: "videos#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
