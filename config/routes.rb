Rails.application.routes.draw do
  resources :posts,  except: :destroy
  resources :bloggers, only: [:new, :create, :show, :index]
  resources :destinations, only: [:show, :index]

  put 'posts/:id/liked', to: 'posts#liked', as: 'liked'



  # get 'destinations/show'

  # get 'destinations/index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
