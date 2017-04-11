class UplinksController < ApplicationController
  before_action :set_uplink, only: [:show, :edit, :update, :destroy]

  # GET /uplinks
  # GET /uplinks.json
  def index
    @uplinks = Uplink.all
  end

  # GET /uplinks/1
  # GET /uplinks/1.json
  def show
  end

  # GET /uplinks/new
  def new
    @uplink = Uplink.new
  end

  # GET /uplinks/1/edit
  def edit
  end

  # POST /uplinks
  # POST /uplinks.json
  def create
    @uplink = Uplink.new(uplink_params)

    respond_to do |format|
      if @uplink.save
        format.html { redirect_to @uplink, notice: 'Uplink was successfully created.' }
        format.json { render :show, status: :created, location: @uplink }
      else
        format.html { render :new }
        format.json { render json: @uplink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uplinks/1
  # PATCH/PUT /uplinks/1.json
  def update
    respond_to do |format|
      if @uplink.update(uplink_params)
        format.html { redirect_to @uplink, notice: 'Uplink was successfully updated.' }
        format.json { render :show, status: :ok, location: @uplink }
      else
        format.html { render :edit }
        format.json { render json: @uplink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uplinks/1
  # DELETE /uplinks/1.json
  def destroy
    @uplink.destroy
    respond_to do |format|
      format.html { redirect_to uplinks_url, notice: 'Uplink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uplink
      @uplink = Uplink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uplink_params
      params.require(:uplink).permit(:cod, :nome_vlan, :banda)
    end
end
