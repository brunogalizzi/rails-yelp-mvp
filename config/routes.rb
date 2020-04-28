Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[new create show index] do
    resources :reviews, only: %i[new create]
  end
end
