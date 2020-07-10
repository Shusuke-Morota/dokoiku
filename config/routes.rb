Rails.application.routes.draw do

	root to: 'home#top'
	devise_for :users

	resources :users
	resources :articles do
		resource :favorites, only: [:create, :destroy]
		resource :comments, only: [:create, :destroy]
	end

	post 'follow/:id', to: 'relationships#follow', as: 'follow'
	post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
	get 'users/following/:user_id', to: 'users#following', as:'users_following'
	get 'users/follower/:user_id', to: 'users#follower', as:'users_follower'

end
