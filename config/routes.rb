Rails.application.routes.draw do
  
  resources :students
  resources :ducks
  
  
	# resources :ducks, only: [:index]
  # resources :students, only: [:index]
  
  
  # 'GET' '/duck', to: 'duck#index', as: 'ducks_path'
  # 'GET' '/duck/new/edit/delte', to: 'duck#index', as: 'ducks_make_path'

end
