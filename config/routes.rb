OldNews::Application.routes.draw do

  resources :users do 
    resources :contacts
    resources :favorites do 
      get "send_favorite"
    end
    # resources :custom_search, only: [:new, :create]

  end

  root 'welcome#index'
  get "/articles", to: "welcome#new"

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  get "/about", to: "about#index"

  get "/coming_soon", to: "coming_soon#index"

  get "/custom_search", to: "custom_search#index"
  post "/custom_search", to: "custom_search#create"
  get "/search_results", to: "custom_search#show"


end
