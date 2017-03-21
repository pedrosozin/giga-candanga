Rails.application.routes.draw do
  root 'instituicoes#index'

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
      put 'desativar', to: 'usuarios#deactivate'
    end
  end

  resources :categorias, except: [:show, :update], path_names: {new: "criar", edit: "editar" } do
    member do
      post :ativar
    end
  end

  devise_for :usuarios,
    controllers: {registrations: 'usuarios/registrations',
                  confirmations: 'usuarios/confirmations',
  }

  resources :usuarios, except: [:show, :destroy], only: [:new, :create, :index]
  resources :usuarios do
    member do
      put 'desativar', to: 'usuarios#deactivate'
    end
  end

  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end
