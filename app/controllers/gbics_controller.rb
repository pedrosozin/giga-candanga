class GbicsController < ApplicationController
  before_action :set_gbic, only: [:show, :edit, :update, :destroy]

  # GET /gbics
  # GET /gbics.json
  def index
    @gbics = Gbic.all
  end

  # GET /gbics/1
  # GET /gbics/1.json
  def show
    @conectadas = Fibra.find_by_sql("Select DISTINCT numero from fibras where id in (Select fibra_id from caixaemendas_fibras where caixaemendas_fibras.caixaemenda_id in (SELECT caixaemendas.id from caixaemendas where  cod REGEXP 'EO-09' and acesso = 1));")
  end

  # GET /gbics/new
  def new
    preparar_form
    @gbic = Gbic.new
    if params[:porta_slot]
      @gbic.porta_slot = PortaSlot.find(params[:porta_slot])
    end
  end

  # GET /gbics/1/edit
  def edit
  end

  # POST /gbics
  # POST /gbics.json
  def create
    @gbic = Gbic.new(gbic_params)

    respond_to do |format|
      if @gbic.save
        format.html { redirect_to @gbic, notice: 'Gbic was successfully created.' }
        format.json { render :show, status: :created, location: @gbic }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @gbic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gbics/1
  # PATCH/PUT /gbics/1.json
  def update
    preparar_form
    respond_to do |format|
      if @gbic.update(gbic_params)
        format.html { redirect_to @gbic, notice: 'Gbic was successfully updated.' }
        format.json { render :show, status: :ok, location: @gbic }
      else
        format.html { render :edit }
        format.json { render json: @gbic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gbics/1
  # DELETE /gbics/1.json
  def destroy
    @gbic.destroy
    respond_to do |format|
      format.html { redirect_to gbics_url, notice: 'Gbic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gbic
      @gbic = Gbic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gbic_params
      params.require(:gbic).permit(:porta_slot_id, :serie, :patrimonio, :tipo)
    end
    def preparar_form
      @porta_slots = PortaSlot.order :porta
    end
end
