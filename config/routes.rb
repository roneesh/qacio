Qacio::Application.routes.draw do
  get "pages/sign_in"

  devise_for :users

  resources :users do
    resources :projects
  end
  
  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  

end