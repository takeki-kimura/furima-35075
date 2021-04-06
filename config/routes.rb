Rails.application.routes.draw do
  get 'furimas/index'
  root to: "furimas#index"

  resources :furimas, only: :index
end