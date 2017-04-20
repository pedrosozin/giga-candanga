class JumpersController < ApplicationController
  before_action :set_jumper, only: [:show, :edit, :update, :destroy]

  # GET /jumpers
  # GET /jumpers.json
  def index
    @jumpers = Jumper.all
  end

  # GET /jumpers/1
  # GET /jumpers/1.json
  def show
  end

  # GET /jumpers/new
  def new
    preparar_form
    @jumper = Jumper.new
    if params[:portadgo]
      @jumper.portadgo = Portadgo.find(params[:portadgo])
    end
  end

  # GET /jumpers/1/edit
  def edit
  end

  # POST /jumpers
  # POST /jumpers.json
  def create
    @jumper = Jumper.new(jumper_params)

    respond_to do |format|
      if @jumper.save
        format.html { redirect_to @jumper, notice: 'Jumper was successfully created.' }
        format.json { render :show, status: :created, location: @jumper }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @jumper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jumpers/1
  # PATCH/PUT /jumpers/1.json
  def update
    preparar_form
    respond_to do |format|
      if @jumper.update(jumper_params)
        format.html { redirect_to @jumper, notice: 'Jumper was successfully updated.' }
        format.json { render :show, status: :ok, location: @jumper }
      else
        format.html { render :edit }
        format.json { render json: @jumper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jumpers/1
  # DELETE /jumpers/1.json
  def destroy
    @jumper.destroy
    respond_to do |format|
      format.html { redirect_to jumpers_url, notice: 'Jumper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jumper
      @jumper = Jumper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jumper_params
      params.require(:jumper).permit(:portadgo_id, :portadgo2_id)
    end

    def preparar_form
      @portadgos = Portadgo.order :cod
    end
end
