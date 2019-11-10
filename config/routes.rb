Rails.application.routes.draw do

	root 'home#index'
	
	get 'sessions/new'
	get 'sign_in' => 'sessions#new'
	post 'sign_in' => 'sessions#create'
	delete 'sign_out' => 'sessions#destroy'
	get 'sobre' => 'home#sobre'
	
	resources :passeios
	resources :cachorros
	resources :pessoas
	resources :permissoes
  
end
