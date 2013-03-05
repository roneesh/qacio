Qacio::Application.routes.draw do
  

  resources :document_versions

  get "pages/sign_in"
  get "pages/test"

  get "/document_versions/:id/annotate", { controller: "DocumentVersions", action: "annotate" }

  devise_for :users

  resources :users do
    resources :projects
  end
  
  resources :documents

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"

  post "/create_annotation", {controller: "Annotations", action: "create"}
  delete "/delete_annotation", {controller: "Annotations", action: "delete"}
  
end