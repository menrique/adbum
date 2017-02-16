Rails.application.routes.draw do

  # Main application entry point (root path)
  root controller: :home, action: :index

  # Routes to manage images
  resources :images do
    post :search, on: :collection
  end

  # Sandbox path to test the API
  get :sandbox, controller: :sandbox, action: :index
  post :sandbox, controller: :sandbox, action: :index

  # Documentation path
  get :docs,    controller: :docs, action: :index

  # API entrypoints
  scope '/api' do
    get :images, controller: :api, action: :images, as: :api_images
  end

  # Handle 404
  get '*path' => redirect('/')
end
