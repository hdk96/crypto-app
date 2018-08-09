Rails.application.routes.draw do
	root 'home#index'
	post '/home/search', 'home#search'

	resources :crypto
end
