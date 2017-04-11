class FusoesController < ApplicationController
  before_action :set_fusao, only: [:show, :edit, :update, :destroy]

  # GET /fusoes
  # GET /fusoes.json
  def index
    @fusoes = Fusao.all
  end

  # GET /fusoes/1
  # GET /fusoes/1.json
  def show
  end

  # GET /fusoes/new
  def new
    preparar_form
    @fusao = Fusao.new
    if params[:fibra]
      @fusao.fibra = Fibra.find(params[:fibra])
    end
  end

  # GET /fusoes/1/edit
  def edit
    preparar_form
  end

  # POST /fusoes
  # POST /fusoes.json
  def create
    @fusao = Fusao.new(fusao_params)

    respond_to do |format|
      if @fusao.save
        format.html { redirect_to @fusao, notice: 'Fusao was successfully created.' }
        format.json { render :show, status: :created, location: @fusao }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @fusao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fusoes/1
  # PATCH/PUT /fusoes/1.json
  def update
    preparar_form
    respond_to do |format|
      if @fusao.update(fusao_params)
        format.html { redirect_to @fusao, notice: 'Fusao was successfully updated.' }
        format.json { render :show, status: :ok, location: @fusao }
      else
        format.html { render :edit }
        format.json { render json: @fusao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fusoes/1
  # DELETE /fusoes/1.json
  def destroy
    @fusao.destroy
    respond_to do |format|
      format.html { redirect_to fusoes_url, notice: 'Fusao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fusao
      @fusao = Fusao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fusao_params
      params.require(:fusao).permit(:fibra_id, :fibra2_id)
    end

    def preparar_form
      @fibras = Fibra.order :numero
    end
end
