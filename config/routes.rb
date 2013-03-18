HappyTo::Application.routes.draw do
  root :to => "mail_merges#new"
  resources :mail_merges
end
