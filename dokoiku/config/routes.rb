Rails.application.routes.draw do

  # get 'categories/index'
  # get 'categories/edit'
	root to: 'home#top'
	get 'home/about'
	devise_for :users

	resources :users
	resources :articles do
		resource :comments, only: [:create, :destroy]
		resource :favorites, only: [:index, :create, :destroy]
	end

	resources :categories, except: [:new]

	post 'follow/:id', to: 'relationships#follow', as: 'follow'
	post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
	get 'users/following/:user_id', to: 'users#following', as:'users_following'
	get 'users/follower/:user_id', to: 'users#follower', as:'users_follower'

	devise_for :admins

	namespace :admins do
		resources :categories
	end

end
