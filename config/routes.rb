Rails.application.routes.draw do
  
  get 'home/index'

  resources :attendances, except: [:new, :show] do
    collection do
      get :take
    end
  end
  resources :subscriptions, except: [:show]
  resources :customers
  resources :plans, except: [:show]
  root 'sessions#new'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'

  resources :users, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
