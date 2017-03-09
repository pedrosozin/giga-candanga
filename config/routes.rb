Rails.application.routes.draw do
  root 'usuarios#index'

  namespace :usuarios do
    get '/', action: 'index', as: 'index'
  end

  devise_scope :usuario do
    # Rotas 'Sessions' Traduzidas
    get 'entrar', to: 'devise/sessions#new', as: 'new_usuario_session'
    post 'criar_sessao', to: 'devise/sessions#create', as: 'usuario_session'
    delete 'deslogar', to: 'devise/sessions#destroy', as: 'destroy_usuario_session'

    # Rotas 'Registrations' Traduzidas
    get 'cancelar', to: 'usuarios/registrations#cancel', as: 'cancel_usuario_registration'
    get 'cadastrar', to: 'usuarios/registrations#new', as: 'new_usuario_registration'
    get 'editar', to: 'usuarios/registrations#edit', as: 'edit_usuario_registration'
    patch '/', to: 'usuarios/registrations#update', as: 'registration'
    put '/', to: 'usuarios/registrations#update'
    delete '/', to: 'usuarios/registrations#destroy'
    post '/', to: 'usuarios/registrations#create'

    # Rotas 'Password' Traduzidas
    get 'nova_senha', to: 'devise/passwords#new', as: 'new_usuario_password'
    get 'mudar_senha', to: 'devise/passwords#edit', as: 'edit_usuario_password'
    patch 'atualizar_senha', to: 'devise/passwords#update', as: 'usuario_password'
    put 'atualizar_senha', to: 'devise/passwords#update'
    post 'nova_senha', to: 'devise/passwords#create'
  end

  devise_for :usuario, skip: [:registrations, :sessions, :passwords], controllers: {
    registrations: 'usuarios/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
