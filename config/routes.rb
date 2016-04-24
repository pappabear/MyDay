Rails.application.routes.draw do

  resources :users

  get     'password_resets/new'
  get     'password_resets/edit'
  get     'account_activations/edit'
  get     'sessions/new'

  root                'static_pages#home'
  get     'help'    => 'static_pages#help'
  get     'about'   => 'static_pages#about'
  get     'terms' => 'static_pages#terms'
  get     'privacy' => 'static_pages#privacy'
  get     'signup'  => 'users#new'
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :todos

  get '/today' => 'todos#today'
  get '/tomorrow' => 'todos#tomorrow'
  get '/someday' => 'todos#someday'
  put '/todos/mark_complete/:id' => 'todos#mark_complete'
  put '/todos/mark_incomplete/:id' => 'todos#mark_incomplete'
  put '/todos/move_to_tomorrow/:id' => 'todos#move_to_tomorrow'
  put '/todos/skip/:id' => 'todos#skip'
  post '/todos/set_due_date/:id' => 'todos#set_due_date'
  post '/todos/sort' => 'todos#sort'

end
