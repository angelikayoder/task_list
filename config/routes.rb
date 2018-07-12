Rails.application.routes.draw do
  resources :tasks do
    collection do
      patch :sort
    end
    member do
      patch :complete
    end
  end
  root 'tasks#index'
  get '/complete/:id', to: 'tasks#complete', as: 'complete'
end
