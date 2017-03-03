Rails.application.routes.draw do
  devise_for :usuarios
  namespace :usuarios do
    get '/', action: 'index', as: 'index' 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
