Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  #get "/upload", to: "uploads#index"
  #post "/upload", to: "uploads#import"
  resources :uploads do 
    collection { post :import}
    collection { post :save}
    collection { post :clean}
    collection { get :imported_files}
    collection { get :contacts_list}    
  end
end
