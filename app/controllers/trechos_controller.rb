class TrechosController < ApplicationController
  before_action :set_trecho, only: [:show, :edit, :update, :destroy]
  has_scope :por_segmento
  # GET /trechos
  # GET /trechos.json
  def index
    @trechos = apply_scopes(Trecho).all
  end

  # GET /trechos/1
  # GET /trechos/1.json
  def show
  end

  # GET /trechos/new
  def new
    preparar_form
    @trecho = Trecho.new
    if params[:segmento]
      @trecho.segmento = Segmento.find(params[:segmento])
    end
    if params[:dgo]
      @trecho.dgo = Dgo.find(params[:dgo])
    end
  end

  # GET /trechos/1/edit
  def edit
    preparar_form
  end

  # POST /trechos
  # POST /trechos.json
  def create
    @trecho = Trecho.new(trecho_params)

    respond_to do |format|
      if @trecho.save
        format.html { redirect_to @trecho, notice: 'Trecho was successfully created.' }
        format.json { render :show, status: :created, location: @trecho }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @trecho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trechos/1
  # PATCH/PUT /trechos/1.json
  def update
    preparar_form
    respond_to do |format|
      if @trecho.update(trecho_params)
        format.html { redirect_to @trecho, notice: 'Trecho was successfully updated.' }
        format.json { render :show, status: :ok, location: @trecho }
      else
        format.html { render :edit }
        format.json { render json: @trecho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trechos/1
  # DELETE /trechos/1.json
  def destroy
    @trecho.destroy
    respond_to do |format|
      format.html { redirect_to trechos_url, notice: 'Trecho was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trecho
      @trecho = Trecho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trecho_params
      params.require(:trecho).permit(:segmento_id, :cod, :comprimento, :ano_fabricacao, :infra, :proprietario, :fabricante, :tipo, :data_criacao, :data_exclusao, :acesso, :dgo_id, :caboacesso)
    end
    def preparar_form
      @segmentos = Segmento.order :numero
      @dgos = Dgo.order :cod
      @caboacessos = Caboacesso.order :cod
    end
end
