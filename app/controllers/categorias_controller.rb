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
    @categoria = Categoria.new( categoria_params )
    @categoria.save

    respond_to do |f|
      f.js { render file: "categorias/create"}
    end

  end

  def edit
    @categoria = Categoria.find_by(id: params[:id])
  end


  def destroy
    @categoria = Categoria.find_by(id: params[:id])
    @categoria.desativa
    respond_to do |f|
      f.js {render file: "categorias/destroy"}
    end
  end

  def ativar
    @categoria = Categoria.find_by(id: params[:id])
    @categoria.ativar
    respond_to do |f|
      f.js {render file: "categorias/ativar" }
    end
  end

  private

  def categoria_params
    params.require(:categoria).permit(:nome)
  end
end
