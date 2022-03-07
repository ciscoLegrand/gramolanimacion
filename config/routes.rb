Rails.application.routes.draw do
  root "mainweb#index"

  resources :legal_texts
  resources :contacts
  
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
