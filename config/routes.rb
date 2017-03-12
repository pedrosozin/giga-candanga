Rails.application.routes.draw do
  root 'usuarios#index'

  resources :instituicoes, except: [:destroy, :show], path_names: {new: "criar", edit: "editar"} do
    member do
      put :arquivar
    end
  end

  resources :repasse_categorias, only: [:create, :destroy, :index] do
    member do
      post :ativar
    end
  end

  resources :categorias, except: [:show, :update], path_names: {new: "criar", edit: "editar"} do
    member do
      post :ativar
    end
  end

  resources :usuarios, except: [:edit, :update, :destroy]

  devise_for :usuario, path_names: {sign_in: "entrar", sign_out: "deslogar", cancel: "cancelar", edit: "editar", new: "cadastrar", "password/new": "nova_senha"},
             controllers: {registrations: 'usuarios/registrations',
                           confirmations: 'usuarios/confirmations',
             }

  # devise_scope :usuario do
  #   # Rotas 'Sessions' Traduzidas
  #   get 'entrar', to: 'devise/sessions#new', as: 'new_usuario_session'
  #   post 'criar_sessao', to: 'devise/sessions#create', as: 'usuario_session'
  #   # delete 'deslogar', to: 'devise/sessions#destroy', as: 'destroy_usuario_session'

  #   # Rotas 'Registrations' Traduzidas
  #   get 'cancelar', to: 'usuarios/registrations#cancel', as:
  #     'cancel_usuario_registration'
  #   get 'cadastrar', to: 'usuarios#new', as: 'new_usuario_registration'
  #   get 'editar', to: 'usuarios/registrations#edit', as:
  #     'edit_usuario_registration'
  #   patch '/', to: 'usuarios/registrations#update', as: 'registration'
  #   put '/', to: 'usuarios/registrations#update'
  #   delete '/', to: 'usuarios/registrations#destroy'
  #   post '/', to: 'usuarios/registrations#create'

  #   # Rotas 'Password' Traduzidas
  #   get 'nova_senha', to: 'devise/passwords#new', as: 'new_usuario_password'
  #   get 'mudar_senha', to: 'devise/passwords#edit', as: 'edit_usuario_password'
  #   patch 'atualizar_senha', to: 'devise/passwords#update', 
  #     as: 'usuario_password'
  #   put 'atualizar_senha', to: 'devise/passwords#update'
  #   post 'nova_senha', to: 'devise/passwords#create'

  #   # Rotas 'Confirmations' Traduzidas
  #   patch 'confirmar', to: 'confirmations#confirm'
  # end


  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end
