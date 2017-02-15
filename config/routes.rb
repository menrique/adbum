Rails.application.routes.draw do

  # Main application entry point (root path)
  root controller: :home, action: :index

  # Routes to manage images
  resources :images do
    post :search, on: :collection
  end

  # Sandbox path to test the API
  get       :sandbox, controller: :sandbox, action: :index

  # Documentation path
  get       :docs,    controller: :docs, action: :index
end
