Rails.application.routes.draw do
  resources :cachorros
	get 'home/index'
  root 'home#index'
  
  resources :pessoas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
