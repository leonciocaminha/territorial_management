Rails.application.routes.draw do
  get 'main/index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions' }

  devise_scope :user do
    get "destroy", :to => "users/sessions#destroy", :as => :destroy_user_session
  end

  authenticated :user do
    root to: 'main#index', as: :authenticated_root
  end
  root to: redirect('/users/auth/ctigi_auth?provider=ctigi_auth')

end
