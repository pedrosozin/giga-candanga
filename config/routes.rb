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

  resources :categorias, except: [:show, :update], path_names: {new: "criar", edit: "editar" } do
    member do
      post :ativar
    end
  end

  devise_for :usuarios,
    controllers: {registrations: 'usuarios/registrations',
                  confirmations: 'usuarios/confirmations',
  }

  resources :usuarios, except: [:show, :destroy]  do
    member do
      put 'desativar', to: 'usuarios#deactivate'
    end
  end
###################################################################################################################################################
  resources :fusoes
  resources :caboacessos
  resources :uplinks
  resources :fibras do
    get 'conectar'
  end
  resources :tubelooses
  resources :trechos
  resources :incidentes
  resources :caixasubs
  resources :postes
  resources :reservas
  resources :caixaemendas
  resources :segmentos
  resources :jumpers
  resources :dgos do
    resources :portadgos do
      get 'conectar' 
      #get 'conf_conexao'
      post 'conf_conexao'
    end
  end
  resources :portadgos do
    get 'conectar'
  end
  resources :gbics
  resources :porta_slots
  resources :portas_slot
  resources :slots
  resources :switches
  resources :geradores
  resources :nobreaks
  resources :sites
  resources :contatos
  # resources :ipas do
  # 	resources :contatos
  #   resources :sites do
  #     resources :switches do
  #       resources :slots do
  #         resources :porta_slots
  #       end
  #     end
  #   end
  # end

  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end
