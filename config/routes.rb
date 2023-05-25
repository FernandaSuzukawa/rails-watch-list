Rails.application.routes.draw do
  resources :bookmarks
  resources :lists
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resourses :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]
end
