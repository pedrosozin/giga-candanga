class RepasseCategoriasController < ApplicationController
  def index
    @repasse_categorias_ativas = RepasseCategoria.ativas
    @repasse_categorias_inativas = RepasseCategoria.inativas
    @repasse_categoria = RepasseCategoria.new
  end

  def create
    @repasse_categoria = RepasseCategoria.new(repasse_categoria_params)
    @repasse_categoria.save

    @repasse_categorias_ativas = RepasseCategoria.ativas

    respond_to do |f|
      f.js { render file: "repasse_categorias/create"}
    end
  end

  def destroy
    @repasse_categoria = RepasseCategoria.find_by(id: params[:id])
    @repasse_categoria.desativa

    @repasse_categorias_ativas = RepasseCategoria.ativas
    @repasse_categorias_inativas = RepasseCategoria.inativas
    respond_to do |f|
      f.js { render file: "repasse_categorias/destroy"}
    end
  end

  def ativar
    @repasse_categoria = RepasseCategoria.find_by(id: params[:id])
    @repasse_categoria.reativa

    @repasse_categorias_ativas = RepasseCategoria.ativas
    @repasse_categorias_inativas = RepasseCategoria.inativas
    respond_to do |f|
      f.js { render file: "repasse_categorias/ativar"}
    end
  end


  private
  
  def repasse_categoria_params
    params.require(:repasse_categoria).permit(:nome)
  end

end
