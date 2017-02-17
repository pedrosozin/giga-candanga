Rails.application.routes.draw do
  get 'access/home', controller: "access", action:"home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root controller: "access", action:"home"
end
