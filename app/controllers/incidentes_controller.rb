class IncidentesController < ApplicationController
  before_action :set_incidente, only: [:show, :edit, :update, :destroy]

  # GET /incidentes
  # GET /incidentes.json
  def index
    @incidentes = Incidente.all
  end

  # GET /incidentes/1
  # GET /incidentes/1.json
  def show
  end

  # GET /incidentes/new
  def new
    preparar_form
    @incidente = Incidente.new
    if params[:trecho]
      @incidente.trecho = Trecho.find(params[:trecho])
    end
  end

  # GET /incidentes/1/edit
  def edit
    preparar_form
  end

  # POST /incidentes
  # POST /incidentes.json
  def create
    @incidente = Incidente.new(incidente_params)

    respond_to do |format|
      if @incidente.save
        format.html { redirect_to @incidente, notice: 'Incidente was successfully created.' }
        format.json { render :show, status: :created, location: @incidente }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentes/1
  # PATCH/PUT /incidentes/1.json
  def update
    preparar_form
    respond_to do |format|
      if @incidente.update(incidente_params)
        format.html { redirect_to @incidente, notice: 'Incidente was successfully updated.' }
        format.json { render :show, status: :ok, location: @incidente }
      else
        format.html { render :edit }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentes/1
  # DELETE /incidentes/1.json
  def destroy
    @incidente.destroy
    respond_to do |format|
      format.html { redirect_to incidentes_url, notice: 'Incidente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidente
      @incidente = Incidente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidente_params
      params.require(:incidente).permit(:trecho_id, :cod, :data, :latitude, :longitude, :responsavel)
    end
    def preparar_form
      @trechos = Trecho.order :cod
    end
end
