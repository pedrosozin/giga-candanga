class UsuariosController < ApplicationController
  def index
    @users = Usuario.all
  end
end
