Rails.application.routes.draw do
  root "mainweb#index"

  resources :legal_texts

end
