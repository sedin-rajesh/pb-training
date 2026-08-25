Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "home#index", as: :authenticated_root
  end
  unauthenticated do
    root to: redirect("/users/sign_in"), as: :unauthenticated_root
  end
  resources :home
end
