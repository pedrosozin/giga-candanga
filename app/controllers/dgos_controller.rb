class DgosController < ApplicationController
  before_action :set_dgo, only: [:show, :edit, :update, :destroy]

  # GET /dgos
  # GET /dgos.json
  def index
    @dgos = Dgo.all
  end

  # GET /dgos/1
  # GET /dgos/1.json
  def show
    @conectadas = Fibra.find_by_sql("Select DISTINCT numero from fibras where id in (Select fibra_id from caixaemendas_fibras where caixaemendas_fibras.caixaemenda_id in (SELECT caixaemendas.id from caixaemendas where  cod REGEXP 'EO-09' and acesso = 1));")
  end

  # GET /dgos/new
  def new
    preparar_form
    @dgo = Dgo.new
    if params[:segmento]
      @dgo.segmento = Segmento.find(params[:segmento])
    end
  end

  # GET /dgos/1/edit
  def edit
  end

  # POST /dgos
  # POST /dgos.json
  def create
    @dgo = Dgo.new(dgo_params)
    respond_to do |format|
      if @dgo.save
        format.html { redirect_to @dgo, notice: 'Dgo was successfully created.' }
        format.json { render :show, status: :created, location: @dgo }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @dgo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dgos/1
  # PATCH/PUT /dgos/1.json
  def update
    preparar_form
    respond_to do |format|
      if @dgo.update(dgo_params)
        format.html { redirect_to @dgo, notice: 'Dgo was successfully updated.' }
        format.json { render :show, status: :ok, location: @dgo }
      else
        format.html { render :edit }
        format.json { render json: @dgo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dgos/1
  # DELETE /dgos/1.json
  def destroy
    @dgo.destroy
    respond_to do |format|
      format.html { redirect_to dgos_url, notice: 'Dgo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dgo
      @dgo = Dgo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dgo_params
      params.require(:dgo).permit(:cod, :segmento_id, :fabricante, :qtd_portas)
    end
    def preparar_form
      @segmento = Segmento.order :numero
    end
end
