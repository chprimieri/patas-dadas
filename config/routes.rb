Rails.application.routes.draw do
  get 'sessions/new'

  root 'home#index'

  resources :passeios
  resources :cachorros
  resources :pessoas
  
	get    'sign_in'   => 'sessions#new'
	post   'sign_in'   => 'sessions#create'
	get 'sign_out'  => 'sessions#destroy'

end