Rails.application.routes.draw do
  get 'scoreboard/index'

  resources :problem_sets do
    resources :solutions
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "scoreboard#index"
end
