class UsuariosController < ApplicationController
  def index
    @users = Usuario.all
    @complements = Complemento.all
    byebug
  end
end
