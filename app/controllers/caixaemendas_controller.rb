class CaixaemendasController < ApplicationController
  before_action :set_caixaemenda, only: [:show, :edit, :update, :destroy]

  # GET /caixaemendas
  # GET /caixaemendas.json
  def index
    @caixaemendas = Caixaemenda.all.page params[:page]
  
  end

  # GET /caixaemendas/1
  # GET /caixaemendas/1.json
  def show
  end

  # GET /caixaemendas/new
  def new
    @caixaemenda = Caixaemenda.new
  end

  # GET /caixaemendas/1/edit
  def edit
  end

  # POST /caixaemendas
  # POST /caixaemendas.json
  def create
    @caixaemenda = Caixaemenda.new(caixaemenda_params)

    respond_to do |format|
      if @caixaemenda.save
        format.html { redirect_to @caixaemenda, notice: 'Caixaemenda was successfully created.' }
        format.json { render :show, status: :created, location: @caixaemenda }
      else
        format.html { render :new }
        format.json { render json: @caixaemenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caixaemendas/1
  # PATCH/PUT /caixaemendas/1.json
  def update
    respond_to do |format|
      if @caixaemenda.update(caixaemenda_params)
        format.html { redirect_to @caixaemenda, notice: 'Caixaemenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @caixaemenda }
      else
        format.html { render :edit }
        format.json { render json: @caixaemenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixaemendas/1
  # DELETE /caixaemendas/1.json
  def destroy
    @caixaemenda.destroy
    respond_to do |format|
      format.html { redirect_to caixaemendas_url, notice: 'Caixaemenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caixaemenda
      @caixaemenda = Caixaemenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caixaemenda_params
      params.require(:caixaemenda).permit(:cod, :fabricante, :tipo, :infra, :latitude, :longitude, :num_desenho, :acesso, :data_criacao, :data_exclusao)
    end
end
