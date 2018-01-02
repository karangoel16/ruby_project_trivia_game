Rails.application.routes.draw do
  get 'quiz/quest'
  post 'quiz/result'
  get 'highscore/index'
  resources :questions
  get 'welcome/index'
  root to: 'welcome#index'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
