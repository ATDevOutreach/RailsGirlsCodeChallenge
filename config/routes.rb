Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  resources :sms_sends do
    get 'sms_sends/new_all', to: 'sms_sends#new_all', on: :collection
    post 'sms_sends', to: 'sms_sends#create_all', on: :collection
  end
  root 'contacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
