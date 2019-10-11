Rails.application.routes.draw do
  get 'sessions/new'

  root 'home#index'
  root 'sessions#new'

  resources :passeios
  resources :cachorros
  resources :pessoas
  
	get    'sign_in'   => 'sessions#new'
	post   'sign_in'   => 'sessions#create'
	delete 'sign_out'  => 'sessions#destroy'

end