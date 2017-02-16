Rails.application.routes.draw do

  # Main application entry point (root path)
  root controller: :home, action: :index

  # Routes to manage the images
  resources :images do
    post :search, on: :collection
  end

  # Sandbox paths to test the API
  get :sandbox, controller: :sandbox, action: :index
  post :sandbox, controller: :sandbox, action: :index

  # Documentation path
  get :docs, controller: :docs, action: :index
  get :about, controller: :about, action: :index

  # API entrypoints
  scope '/api' do
    get :images, controller: :api, action: :images, as: :api_images
    get :not_found, controller: :api, action: :not_found, as: :api_not_found
    get '*path' => redirect('/api/not_found')
  end

  # Handle missing paths
  get '*path' => redirect('/')
end
