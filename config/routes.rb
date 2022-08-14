Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :widgets, only: [ :show, :index ]
  resources :widget_ratings, only: [ :create ]

  resources :widgets, only: [ :show ] do
    resources :ratings, only: [ :create ]
  end

  namespace :customer_service do
    resources :widgets, only: [ :show, :update, :destroy ]
  end

  get "manufacturer/:id", to: "manufacturers#show"

  if Rails.env.development?
    resources :design_system_docs, only: [:index]
  end

  ####
  # Custom routes start here
  #
  # For each new custom route:
  #
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # Used in podcast ads for the 'amazing' campaign
  get "/amazing", to: redirect("/widgets")
end
