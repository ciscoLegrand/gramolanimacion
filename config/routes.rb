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
end
