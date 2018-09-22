Rails.application.routes.draw do
  devise_for :users
  get 'sms_sends/new_all', to: 'sms_sends#new_all'
  post 'sms_sends', to: 'sms_sends#create_all'
  resources :contacts
  resources :sms_sends
  root 'contacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
