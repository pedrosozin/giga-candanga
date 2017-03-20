class InstituicoesController < ApplicationController
  before_action :set_instituicao, only: [:edit, :update, :arquivar]
  before_action :initialize_categorias, only: [:new, :edit, :create, :update]

  def index
    @instituicoes = Instituicao.ativas
  end

  def new
    @instituicao = Instituicao.new
    @instituicao.build_form_dependency(@responsavel_tipos)
  end

  def edit
    @instituicao.build_form_dependency(@responsavel_tipos)
  end

  def create
    @instituicao = Instituicao.new(instituicao_params)

    if @instituicao.save
      set_flash("Registro criado com sucesso!")
      redirect_to instituicoes_path
    else
      @instituicao.build_form_when_error(@responsavel_tipos)
      render :new
    end
  end

  def update
    if @instituicao.update(instituicao_params)
      set_flash("Registro alterado com sucesso!")
      redirect_to instituicoes_path
    else
      @instituicao.build_form_when_error(@responsavel_tipos)
      render :edit
    end
  end

  def arquivar
    @instituicao.arquiva ? set_flash("Registro arquivado com sucesso!") :
        set_flash("Falha ao arquivar registro", "Erro", MSG_TYPE_ERROR)
    redirect_to instituicoes_url
  end

  private

  def set_instituicao
    @instituicao = Instituicao.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instituicao_params
    params.require(:instituicao).permit(:id, :nome, :sigla, :cnpj, :data_aprovacao, :resumo, :site, :categoria_id,
                                        endereco_attributes: [
                                            :id,
                                            :cep,
                                            :cidade,
                                            :estado,
                                            :bairro,
                                            :endereco
                                        ],
                                        responsaveis_attributes: [
                                            :id,
                                            :cargo,
                                            :nome,
                                            :responsavel_tipo_id,
                                            telefones_attributes: [
                                                :id,
                                                :numero,
                                                :_destroy],
                                            emails_attributes: [
                                                :id,
                                                :email,
                                                :_destroy]])
  end

  def set_flash(mensagem, titulo="Sucesso", tipo=MSG_TYPE_SUCCESS)
    flash[:type] = tipo
    flash[:title] = titulo
    flash[:notice] = mensagem
  end

  def initialize_categorias
    @responsavel_tipos = ResponsavelTipo.all
    @categorias = Categoria.ativas
  end
end
