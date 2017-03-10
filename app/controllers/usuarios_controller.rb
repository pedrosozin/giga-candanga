class UsuariosController < ApplicationController
  before_action :usuario_params, only: [:create]

  def index
    @users = Usuario.all
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.create(usuario_params)
    render :index
  end

  def disable
    @usuario.disable

    respond_to do |format|
      format.html {render :index}
    end
  end

  def update
  end

  def edit
  end

  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation,
                                    :nome, :telefone, :ativo)
  end

end
