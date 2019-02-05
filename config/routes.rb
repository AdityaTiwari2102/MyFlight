Rails.application.routes.draw do
  root 'root_page#home'

  get '/home', to: 'root_page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
