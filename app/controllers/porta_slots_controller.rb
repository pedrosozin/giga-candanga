class PortaSlotsController < ApplicationController
  before_action :set_porta_slot, only: [:show, :edit, :update, :destroy]

  # GET /porta_slots
  # GET /porta_slots.json
  def index
    @porta_slots = PortaSlot.all
  end

  # GET /porta_slots/1
  # GET /porta_slots/1.json
  def show
  end

  # GET /porta_slots/new
  def new
    preparar_form
    @porta_slot = PortaSlot.new
    if params[:slot]
      @porta_slot.slot = Slot.find(params[:slot])
    end
  end

  # GET /porta_slots/1/edit
  def edit
  end

  # POST /porta_slots
  # POST /porta_slots.json
  def create
    @porta_slot = PortaSlot.new(porta_slot_params)

    respond_to do |format|
      if @porta_slot.save
        format.html { redirect_to @porta_slot, notice: 'Porta slot was successfully created.' }
        format.json { render :show, status: :created, location: @porta_slot }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @porta_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /porta_slots/1
  # PATCH/PUT /porta_slots/1.json
  def update
    preparar_form
    respond_to do |format|
      if @porta_slot.update(porta_slot_params)
        format.html { redirect_to @porta_slot, notice: 'Porta slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @porta_slot }
      else
        format.html { render :edit }
        format.json { render json: @porta_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /porta_slots/1
  # DELETE /porta_slots/1.json
  def destroy
    @porta_slot.destroy
    respond_to do |format|
      format.html { redirect_to porta_slots_url, notice: 'Porta slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_porta_slot
      @porta_slot = PortaSlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def porta_slot_params
      params.require(:porta_slot).permit(:slot_id, :porta, :tipo)
    end
    def preparar_form
      @slots = Slot.order :serie
    end
end
