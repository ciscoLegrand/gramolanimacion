Rails.application.routes.draw do
  get 'legal_texts/index'
  get 'legal_texts/show'
  get 'legal_texts/new'
  get 'legal_texts/edit'
  get 'legal_texts/create'
  get 'legal_texts/update'
  get 'legal_texts/destroy'

  root "mainweb#index"

end
