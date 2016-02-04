Rails.application.routes.draw do
  root 'home#index'

  get 'sign-up', to: 'users#new', as: 'sign_up'
  post 'sign-up', to: 'users#create'
  get 'sign-in', to: 'sessions#new', as: 'new_session'
  post 'sign-in', to: 'sessions#create'
  get 'exit', to: 'sessions#destroy', as: 'destroy_session'

  resources :boards do
    resources :tasks do
      post 'set/:mark', to: 'tasks#mark_task_as_finished', as: 'mark_finished'
      resources :comments
    end
  end

  get '/boards', to: redirect('/')


end
