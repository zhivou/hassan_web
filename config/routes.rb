Rails.application.routes.draw do

  root 'generators#index'

  controller :admin do
    get 'admin' => :index
    get 'jobs' => :jobs
    get 'show_users' => :show_users
    get 'show_mechanical_props' => :show_mechanical_props
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    post 'logout' => :destroy
  end

  resources :mechanical_props
  resources :users
  resources :generators
  resources :admin
end
