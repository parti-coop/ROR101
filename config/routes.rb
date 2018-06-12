Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :categories
  root 'home#index'
end
