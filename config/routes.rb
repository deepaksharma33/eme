Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'v1/tickets#index'

  namespace :v1 do
    resources :tickets, only: %i[index create show] do
      get '/page/:page', action: :index, on: :collection
      get '/tickets', to: redirect('/tickets/page/1')
    end
  end
end
