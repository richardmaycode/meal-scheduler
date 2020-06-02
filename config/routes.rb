Rails.application.routes.draw do
  get 'plans/new'
  get 'plans/create'
  get 'plans/edit'
  get 'plans/update'
  get 'plans/destroy'
  resources :recipes
  resources :weeks
  get 'pages/home'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
