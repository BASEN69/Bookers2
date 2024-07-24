Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password, :name, :email], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    devise_for :users

    resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

    resources :users, only: [:show, :edit, :update, :index]
    get 'home/about' => 'homes#about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
