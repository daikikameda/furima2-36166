Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:index, :create]
    resources :user_purchases
    resources :buy_form
  end
end
