Rails.application.routes.draw do
	get 'home/index'
  root 'home#index'

  resources :passeios
  resources :cachorros
  resources :pessoas

end
