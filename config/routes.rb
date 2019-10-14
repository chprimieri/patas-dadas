Rails.application.routes.draw do

	root 'home#index'
	
	get 'sessions/new'
	get 'sign_in' => 'sessions#new'
	post 'sign_in' => 'sessions#create'
	get 'sign_out' => 'sessions#destroy'
	
	resources :passeios
	resources :cachorros
	resources :pessoas
  
end
