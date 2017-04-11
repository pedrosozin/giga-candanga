class CaixasubsController < ApplicationController
  before_action :set_caixasub, only: [:show, :edit, :update, :destroy]

  # GET /caixasubs
  # GET /caixasubs.json
  def index
    @caixasubs = Caixasub.all
  end

  # GET /caixasubs/1
  # GET /caixasubs/1.json
  def show
  end

  # GET /caixasubs/new
  def new
    preparar_form
    @caixasub = Caixasub.new
    if params[:reserva]
      @caixasub.reserva = Reserva.find(params[:reserva])
      @caixasub.caixaemenda = nil
    end
    if params[:caixaemenda]
      @caixasub.caixaemenda = Caixaemenda.find(params[:caixaemenda])
    end
  end

  # GET /caixasubs/1/edit
  def edit
    preparar_form
  end

  # POST /caixasubs
  # POST /caixasubs.json
  def create
    @caixasub = Caixasub.new(caixasub_params)

    respond_to do |format|
      if @caixasub.save
        format.html { redirect_to @caixasub, notice: 'Caixasub was successfully created.' }
        format.json { render :show, status: :created, location: @caixasub }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @caixasub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caixasubs/1
  # PATCH/PUT /caixasubs/1.json
  def update
    preparar_form
    respond_to do |format|
      if @caixasub.update(caixasub_params)
        format.html { redirect_to @caixasub, notice: 'Caixasub was successfully updated.' }
        format.json { render :show, status: :ok, location: @caixasub }
      else
        format.html { render :edit }
        format.json { render json: @caixasub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixasubs/1
  # DELETE /caixasubs/1.json
  def destroy
    @caixasub.destroy
    respond_to do |format|
      format.html { redirect_to caixasubs_url, notice: 'Caixasub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caixasub
      @caixasub = Caixasub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caixasub_params
      params.require(:caixasub).permit(:cod, :tipo, :infra, :latitude, :longitude, :num_desenho, :tipo_tampa, :reserva_id , :caixaemenda_id)
    end

    def preparar_form
      @reservas = Reserva.order :cod
      @caixaemendas = Caixaemenda.order :cod
    end
end
