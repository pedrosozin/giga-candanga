Rails.application.routes.draw do
  root 'usuarios#index'

  resources :instituicoes, path_names: {new: "criar", edit:"editar"}

  resources :repasse_categorias do 
    member do
      post :ativar
    end
  end

  resources :categorias, path_names: {new: "criar", edit: "editar" } do
    member do
      post :ativar
    end
  end

  namespace :usuarios do
    get '/', action: 'index', as: 'index'
  end

  devise_scope :usuario do
    # Rotas 'Sessions' Traduzidas
    get 'entrar', to: 'devise/sessions#new', as: 'new_usuario_session'
    post 'criar_sessao', to: 'devise/sessions#create', as: 'usuario_session'
    delete 'deslogar', to: 'devise/sessions#destroy', as: 'destroy_usuario_session'

    # Rotas 'Registrations' Traduzidas
    get 'cancelar', to: 'devise/registrations#cancel', as: 'cancel_usuario_registration'
    get 'cadastrar', to: 'devise/registrations#new', as: 'new_usuario_registration'
    get 'editar', to: 'devise/registrations#edit', as: 'edit_usuario_registration'
    patch '/', to: 'devise/registrations#update', as: 'registration'
    put '/', to: 'devise/registrations#update'
    delete '/', to: 'devise/registrations#destroy'
    post '/', to: 'devise/registrations#create'

    # Rotas 'Password' Traduzidas
    get 'nova_senha', to: 'devise/passwords#new', as: 'new_usuario_password'
    get 'mudar_senha', to: 'devise/passwords#edit', as: 'edit_usuario_password'
    patch 'atualizar_senha', to: 'devise/passwords#update', as: 'usuario_password'
    put 'atualizar_senha', to: 'devise/passwords#update'
    post 'nova_senha', to: 'devise/passwords#create'
  end
  
  devise_for :usuario, skip: [:registrations, :sessions, :passwords]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
