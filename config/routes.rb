TrendScout::Engine.routes.draw do
  resources :scouts do
    post :trigger, on: :member
  end

  resources :alerts, only: [:index]

  root to: 'scouts#index'
end
