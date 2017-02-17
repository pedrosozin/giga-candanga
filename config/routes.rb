Rails.application.routes.draw do
  get 'access/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "access/home"
end
