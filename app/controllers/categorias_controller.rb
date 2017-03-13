class CategoriasController < ApplicationController
  before_action :find_categoria, only: [:destroy, :edit, :ativar]
  before_action :create_categoria, only: [:index, :new]

  def index
    @categorias_ativas = Categoria.ativas
    @categorias_inativas = Categoria.inativas
  end

  def new
  end

  def edit
  end

  def create
    @categoria = Categoria.new(categoria_params)
    @categoria.save

    redirect_to categorias_path
  end

  def destroy
    @categoria.desativa
    redirect_to categorias_path
  end

  def ativar
    @categoria.ativar
    redirect_to categorias_path
  end

  private

  def find_categoria
    @categoria = Categoria.find_by(id: params[:id])
  end

  def categoria_params
    params.require(:categoria).permit(:nome)
  end

  def create_categoria
    @categoria = Categoria.new
  end
end
