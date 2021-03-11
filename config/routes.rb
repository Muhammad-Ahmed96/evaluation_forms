Rails.application.routes.draw do
  resources :options
  resources :answers
  resources :forms_responses
  resources :questions
  resources :forms
  resources :users
  root 'forms_responses#index'
  post 'send-form', to: "forms#send_form", as: 'send_form'
  get 'fill-form/:id', to: 'forms_responses#fill_form'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
