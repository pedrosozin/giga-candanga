class InstituicoesController < ApplicationController
  before_action :set_instituicao, only: [:show, :edit, :update, :destroy]

  # GET /instituicoes
  # GET /instituicoes.json
  def index
    @instituicoes = Instituicao.all
  end

  # GET /instituicoes/1
  # GET /instituicoes/1.json
  def show
  end

  # GET /instituicoes/new
  def new
    @instituicao = Instituicao.new
    @categorias = Categoria.ativas
    @responsavel_tipos = ResponsavelTipo.all
    @instituicao.build_form_dependency(@responsavel_tipos)

  end

  # GET /instituicoes/1/edit
  def edit
    @categorias = Categoria.ativas
    @responsavel_tipos = ResponsavelTipo.all
    @instituicao.build_form_dependency(@responsavel_tipos)
  end

  # POST /instituicoes
  # POST /instituicoes.json
  def create
    @instituicao = Instituicao.new(instituicao_params)
    puts instituicao_params.to_h
    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully created.' }
        format.json { render :show, status: :created, location: @instituicao }
      else
        @responsavel_tipos = ResponsavelTipo.all
        @categorias = Categoria.ativas
        @instituicao.build_form_when_error(@responsavel_tipos)
        format.html { render :new }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicoes/1
  # PATCH/PUT /instituicoes/1.json
  def update
    respond_to do |format|
      if @instituicao.update(instituicao_params)
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully updated.' }
        format.json { render :show, status: :ok, location: @instituicao }
      else
        @categorias = Categoria.ativas
        @responsavel_tipos = ResponsavelTipo.all
        @instituicao.build_form_when_error(@responsavel_tipos)
        format.html { render :edit }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicoes/1
  # DELETE /instituicoes/1.json
  def destroy
    @instituicao.destroy
    respond_to do |format|
      format.html { redirect_to instituicoes_url, notice: 'Instituicao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_instituicao
    @instituicao = Instituicao.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instituicao_params
    params.require(:instituicao).permit(:id, :nome, :sigla, :cnpj, :data_aprovacao, :resumo, :site, :categoria_id,
                                        {endereco_attributes: [:id, :cep, :cidade, :estado, :bairro, :endereco]},
                                        {responsaveis_attributes: [:id, :cargo, :nome,:responsavel_tipo_id, {telefones_attributes: [:id, :numero, :_destroy]},{emails_attributes:[:id,:email, :_destroy]}]})
  end
end
