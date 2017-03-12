class CategoriasController < ApplicationController
  def index
    @categorias_ativas = Categoria.ativas
    @categorias_inativas = Categoria.inativas
    @categoria = Categoria.new
  end

  def new
    @categoria = Categoria.new
  end

  def create
    @categoria = Categoria.new(categoria_params)
    @categoria.save

    redirect_to categorias_path
  end

  def edit
    @categoria = Categoria.find_by(id: params[:id])
  end

  def destroy
    @categoria = Categoria.find_by(id: params[:id])
    @categoria.desativa
    redirect_to categorias_path
  end

  def ativar
    @categoria = Categoria.find_by(id: params[:id])
    @categoria.ativar
    redirect_to categorias_path
  end

  private

  def categoria_params
    params.require(:categoria).permit(:nome)
  end
end
