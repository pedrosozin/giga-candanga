class UsuariosController < ApplicationController

  def index
    @usuarios = Usuario.all_active
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to :usuarios, notice: 'Usuário criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to :usuarios, notice: 'Usuário atualizado com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def deactivate
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      if @usuario.deactivate
        format.html { redirect_to :usuarios, notice: 'Usuário desativado com sucesso' }
      else
        format.html { redirect_to :usuarios, alert: 'Usuário não pode ser desativado' }
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation,
                                    :nome, :telefone, :ativo)
  end
end
