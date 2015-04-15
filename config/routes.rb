Jqueryfileuploadrailscarrierwave::Application.routes.draw do

  get "result/expression"

  get "result/mapping"

  get "result/quality"

  get "result/showquality"

  get "result/showqualityDetails"

  get "result/transcript"

  get "result/trim"

  resources :step_qas


  resources :pipelines


  resources :analyses


  get "static_pages/help"

  devise_for :users

  resources :documents

  root to: 'home#index' 

  devise_scope :user do
     get "sign_in", :to => "devise/sessions#new"
     get "sign_out", :to => "devise/sessions#destroy"
     get "sign_up", :to => "devise/registrations#new"
     get "edit", :to => "devise/registrations#edit"
 end
 
end
