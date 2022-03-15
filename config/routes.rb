Rails.application.routes.draw do
  root "mainweb#index"
  
  match 'categorias/:category_id',     to: 'mainweb#site_category',     via: :get, as: :site_category
  match 'textos/:legal_text_id',       to: 'mainweb#site_legal_text',   via: :get, as: :site_legal_text
  
  scope '/admin' do
    resources :legal_texts
    resources :contacts
    resources :products
    resources :categories do 
      resources :products
    end
    resources :email_base_templates do 
      resources :email_custom_templates, except: %w[show]
    end 
  end
  
  match "/cookies", to: 'mainweb#cookies',              via: [:get, :post]
  match "/404",     to: "errors#not_found",             via: :all
  match "/500",     to: "errors#internal_server_error", via: :all
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get  'login',        to: 'users/sessions#new',              as: :login
    post 'login',        to: 'users/sessions#create',           as: :create_new_session
    get  'register',     to: 'users/registrations#new',         as: :register
    post 'register',     to: 'users/registrations#create',      as: :registration
    get  'forgot_password', to: 'users/passwords#new',          as: :forgot_password
    post 'forgot_password', to: 'users/passwords#create',       as: :create_forgot_password
    # get  'profile',      to: 'user_registrations#edit',        as: :edit_profile
    # put  'profile',      to: 'user_registrations#update',      as: :update_profile
    get  'logout',       to: 'users/sessions#destroy',          as: :logout
  end
end
