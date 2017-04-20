class TubeloosesController < ApplicationController
  before_action :set_tubeloose, only: [:show, :edit, :update, :destroy]

  # GET /tubelooses
  # GET /tubelooses.json
  def index
    @tubelooses = Tubeloose.all
  end

  # GET /tubelooses/1
  # GET /tubelooses/1.json
  def show
  end

  # GET /tubelooses/new
  def new
    preparar_form
    @tubeloose = Tubeloose.new
    if params[:trecho]
      @tubeloose.trecho = Trecho.find(params[:trecho])
    end
  end

  # GET /tubelooses/1/edit
  def edit
    preparar_form
  end

  # POST /tubelooses
  # POST /tubelooses.json
  def create
    @tubeloose = Tubeloose.new(tubeloose_params)

    respond_to do |format|
      if @tubeloose.save
        format.html { redirect_to @tubeloose, notice: 'Tubeloose was successfully created.' }
        format.json { render :show, status: :created, location: @tubeloose }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @tubeloose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tubelooses/1
  # PATCH/PUT /tubelooses/1.json
  def update
    preparar_form
    respond_to do |format|
      if @tubeloose.update(tubeloose_params)
        format.html { redirect_to @tubeloose, notice: 'Tubeloose was successfully updated.' }
        format.json { render :show, status: :ok, location: @tubeloose }
      else
        format.html { render :edit }
        format.json { render json: @tubeloose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tubelooses/1
  # DELETE /tubelooses/1.json
  def destroy
    @tubeloose.destroy
    respond_to do |format|
      format.html { redirect_to tubelooses_url, notice: 'Tubeloose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tubeloose
      @tubeloose = Tubeloose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tubeloose_params
      params.require(:tubeloose).permit(:trecho_id, :numero)
    end
    def preparar_form
      @trechos = Trecho.order :cod
    end
end
