class GeradoresController < ApplicationController
  before_action :set_gerador, only: [:show, :edit, :update, :destroy]

  # GET /geradores
  # GET /geradores.json
  def index
    @geradores = Gerador.all
  end

  # GET /geradores/1
  # GET /geradores/1.json
  def show
  end

  # GET /geradores/new
  def new
    preparar_form
    @gerador = Gerador.new
    if params[:site]
      @gerador.site = Site.find(params[:site])
    end
  end

  # GET /geradores/1/edit
  def edit
  end

  # POST /geradores
  # POST /geradores.json
  def create
    @gerador = Gerador.new(gerador_params)

    respond_to do |format|
      if @gerador.save
        format.html { redirect_to @gerador, notice: 'Gerador was successfully created.' }
        format.json { render :show, status: :created, location: @gerador }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @gerador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geradores/1
  # PATCH/PUT /geradores/1.json
  def update
    preparar_form
    respond_to do |format|
      if @gerador.update(gerador_params)
        format.html { redirect_to @gerador, notice: 'Gerador was successfully updated.' }
        format.json { render :show, status: :ok, location: @gerador }
      else
        format.html { render :edit }
        format.json { render json: @gerador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geradores/1
  # DELETE /geradores/1.json
  def destroy
    @gerador.destroy
    respond_to do |format|
      format.html { redirect_to geradores_url, notice: 'Gerador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gerador
      @gerador = Gerador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gerador_params
      params.require(:gerador).permit(:site_id, :potencia, :fabricante, :patrimonio)
    end
    def preparar_form
      @sites = Site.order :nome
    end
end
