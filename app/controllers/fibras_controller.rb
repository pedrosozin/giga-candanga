class FibrasController < ApplicationController
  before_action :set_fibra, only: [:show, :edit, :update, :destroy]

  # GET /fibras
  # GET /fibras.json
  def index
    @fibras = Fibra.all
  end

  # GET /fibras/1
  # GET /fibras/1.json
  def show
  end

  # GET /fibras/new
  def new
    preparar_form
    @fibra = Fibra.new
    if params[:tubeloose]
      @fibra.tubeloose = Tubeloose.find(params[:tubeloose])
    end
  end

  # GET /fibras/1/edit
  def edit
    preparar_form
  end

  # POST /fibras
  # POST /fibras.json
  def create
    @fibra = Fibra.new(fibra_params)

    respond_to do |format|
      if @fibra.save
        format.html { redirect_to @fibra, notice: 'Fibra was successfully created.' }
        format.json { render :show, status: :created, location: @fibra }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @fibra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fibras/1
  # PATCH/PUT /fibras/1.json
  def update
    preparar_form
    respond_to do |format|
      if @fibra.update(fibra_params)
        format.html { redirect_to @fibra, notice: 'Fibra was successfully updated.' }
        format.json { render :show, status: :ok, location: @fibra }
      else

        format.html { render :edit }
        format.json { render json: @fibra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fibras/1
  # DELETE /fibras/1.json
  def destroy
    @fibra.destroy
    respond_to do |format|
      format.html { redirect_to fibras_url, notice: 'Fibra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def conectar
    preparar_form
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fibra
      @fibra = Fibra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fibra_params
      params.require(:fibra).permit(:tubeloose_id, :numero, :grupo, :cor, :situacao, :proprietario, :info)
    end

    def preparar_form
      @tubelooses = Tubeloose.order :numero
    end
end
