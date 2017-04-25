class IpasController < ApplicationController
  before_action :set_ipa, only: [:show, :edit, :update, :destroy]

  # GET /ipas
  # GET /ipas.json
  def index
    @ipas = Ipa.all
  end

  # GET /ipas/1
  # GET /ipas/1.json
  def show
    
  end

  # GET /ipas/new
  def new
    @ipa = Ipa.new
  end

  # GET /ipas/1/edit
  def edit
  end

  # POST /ipas
  # POST /ipas.json
  def create
    @ipa = Ipa.new(ipa_params)

    respond_to do |format|
      if @ipa.save
        format.html { redirect_to @ipa, notice: 'Ipa was successfully created.' }
        format.json { render :show, status: :created, location: @ipa }
      else
        format.html { render :new }
        format.json { render json: @ipa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ipas/1
  # PATCH/PUT /ipas/1.json
  def update
    respond_to do |format|
      if @ipa.update(ipa_params)
        format.html { redirect_to @ipa, notice: 'Ipa was successfully updated.' }
        format.json { render :show, status: :ok, location: @ipa }
      else
        format.html { render :edit }
        format.json { render json: @ipa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ipas/1
  # DELETE /ipas/1.json
  def destroy
    @ipa.destroy
    respond_to do |format|
      format.html { redirect_to ipas_url, notice: 'Ipa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ipa
      @ipa = Ipa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ipa_params
      params.require(:ipa).permit(:nome, :tipo)
    end
end
