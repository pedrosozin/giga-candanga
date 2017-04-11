class PostesController < ApplicationController
  before_action :set_poste, only: [:show, :edit, :update, :destroy]

  # GET /postes
  # GET /postes.json
  def index
    @postes = Poste.all
  end

  # GET /postes/1
  # GET /postes/1.json
  def show
  end

  # GET /postes/new
  def new
    preparar_form
    @poste = Poste.new
    if params[:reserva]
      @poste.reserva = Reserva.find(params[:reserva])
    end
     if params[:caixaemenda]
      @poste.caixaemenda = Caixaemenda.find(params[:caixaemenda])
    end
  end

  # GET /postes/1/edit
  def edit
    preparar_form
  end

  # POST /postes
  # POST /postes.json
  def create
    @poste = Poste.new(poste_params)

    respond_to do |format|
      if @poste.save
        format.html { redirect_to @poste, notice: 'Poste was successfully created.' }
        format.json { render :show, status: :created, location: @poste }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @poste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postes/1
  # PATCH/PUT /postes/1.json
  def update
    preparar_form
    respond_to do |format|
      if @poste.update(poste_params)
        format.html { redirect_to @poste, notice: 'Poste was successfully updated.' }
        format.json { render :show, status: :ok, location: @poste }
      else
        format.html { render :edit }
        format.json { render json: @poste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postes/1
  # DELETE /postes/1.json
  def destroy
    @poste.destroy
    respond_to do |format|
      format.html { redirect_to postes_url, notice: 'Poste was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poste
      @poste = Poste.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poste_params
      params.require(:poste).permit(:cod, :latitude, :longitude, :reserva_id, :caixaemenda_id)
    end
    def preparar_form
      @reservas = Reserva.order :cod
      @caixaemendas = Caixaemenda.order :cod
    end
end
