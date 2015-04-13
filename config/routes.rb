Jqueryfileuploadrailscarrierwave::Application.routes.draw do

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
