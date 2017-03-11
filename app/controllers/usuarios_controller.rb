class UsuariosController < ApplicationController
  before_action :usuario_params, only: [:create]
  before_action :authenticate_usuario!, unless: [:new]

  def index
    @usuarios = Usuario.all
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.create(usuario_params)
    respond_to do |format|
      format.html { redirect_to :usuarios }
    end
  end

  def disable
    @usuario.disable
    respond_to do |format|
      format.html { redirect_to :usuarios }
    end
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  protected

  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation,
                                    :nome, :telefone, :ativo)
  end

end
