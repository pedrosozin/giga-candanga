class InstituicoesController < ApplicationController
  before_action :set_instituicao, only: [:edit, :update, :arquivar]

  # GET /instituicoes
  # GET /instituicoes.json
  def index
    @instituicoes = if params[:search].present?
                      Instituicao.search(params[:search])
                    else
                      Instituicao.ativas
                    end
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
  # fazer before action para o necessario
  def create
    @instituicao = Instituicao.new(instituicao_params)
    @responsavel_tipos = ResponsavelTipo.all
    @categorias = Categoria.ativas
    respond_to do |format|
      if @instituicao.save
        flash[:type] = MSG_TYPE_SUCCESS
        flash[:title] = "Sucesso"
        flash[:notice] = "Registro criado com sucesso"
        format.html { redirect_to instituicoes_path }
        format.json { render :show, status: :created, location: @instituicao }
      else
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
        flash[:type] = MSG_TYPE_SUCCESS
        flash[:title] = "Sucesso"
        flash[:notice] = "Registro alterado com sucesso"
        format.html { redirect_to instituicoes_path }
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
  def arquivar
    if @instituicao.arquiva
      flash[:type] = MSG_TYPE_SUCCESS
      flash[:title] = "Sucesso"
      flash[:notice] = "Registro arquivado com sucesso"
      respond_to do |format|
        format.html { redirect_to instituicoes_url }
        format.json { head :no_content }
      end
    else
      flash[:type] = MSG_TYPE_ERROR
      flash[:title] = "Erro"
      flash[:notice] = "Falha ao arquivar registro"
      redirect_to instituicoes_url
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
                                        {responsaveis_attributes: [:id, :cargo, :nome, :responsavel_tipo_id, {telefones_attributes: [:id, :numero, :_destroy]}, {emails_attributes: [:id, :email, :_destroy]}]})
  end
end
