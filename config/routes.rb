Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts
  resources :relations, only: %i(create destroy)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users, only: %i(index show), param: :name
  resources :users, only: %i(index show), param: :name do
    resources :posts, only: %i(index), controller: 'users/posts'
    resources :relation_lists, only: %i(index), controller: 'users/relation_lists'
  end

  resource :setting do
    resource :profile, only: %i(edit update), controller: 'setting/profile'
  end
end
