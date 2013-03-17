HappyTo::Application.routes.draw do
  root :to => "mail_merge#new"
  resources :mail_merge
end
