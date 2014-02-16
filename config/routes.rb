OldNews::Application.routes.draw do
  resources :users do 
    resources :contacts
    resources :favorites
  end

  root 'welcome#index'

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  get "/about", to: "about#index"


end
