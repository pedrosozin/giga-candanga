class RepasseCategoriasController < ApplicationController
  before_action :find_repasse_categoria, only: [:destroy, :ativar]

  def index
    @repasse_categorias_ativas = RepasseCategoria.ativas
    @repasse_categorias_inativas = RepasseCategoria.inativas
    @repasse_categoria = RepasseCategoria.new
  end

  def create
    @repasse_categoria = RepasseCategoria.new(repasse_categoria_params)
    @repasse_categoria.save

    redirect_to repasse_categorias_path
  end

  def destroy
    @repasse_categoria.desativa

    redirect_to repasse_categorias_path
  end

  def ativar
    @repasse_categoria.reativa

    redirect_to repasse_categorias_path
  end

  private

  def repasse_categoria_params
    params.require(:repasse_categoria).permit(:nome)
  end

  def find_repasse_categoria
    @repasse_categoria = RepasseCategoria.find_by(id: params[:id])
  end
end
