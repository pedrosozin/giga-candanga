class CaboacessosController < ApplicationController
  before_action :set_caboacesso, only: [:show, :edit, :update, :destroy]

  # GET /caboacessos
  # GET /caboacessos.json
  def index
    @caboacessos = Caboacesso.all
  end

  # GET /caboacessos/1
  # GET /caboacessos/1.json
  def show
  end

  # GET /caboacessos/new
  def new
    preparar_form
    @caboacesso = Caboacesso.new
    if params[:site]
      @caboacesso.site = Site.find(params[:site])
    end
    if params[:dgo]
      @caboacesso.dgo = Dgo.find(params[:dgo])
    end
  end

  # GET /caboacessos/1/edit
  def edit
    preparar_form
  end

  # POST /caboacessos
  # POST /caboacessos.json
  def create
    @caboacesso = Caboacesso.new(caboacesso_params)

    respond_to do |format|
      if @caboacesso.save
        format.html { redirect_to @caboacesso, notice: 'Caboacesso was successfully created.' }
        format.json { render :show, status: :created, location: @caboacesso }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @caboacesso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caboacessos/1
  # PATCH/PUT /caboacessos/1.json
  def update
    preparar_form
    respond_to do |format|
      if @caboacesso.update(caboacesso_params)
        format.html { redirect_to @caboacesso, notice: 'Caboacesso was successfully updated.' }
        format.json { render :show, status: :ok, location: @caboacesso }
      else
        format.html { render :edit }
        format.json { render json: @caboacesso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caboacessos/1
  # DELETE /caboacessos/1.json
  def destroy
    @caboacesso.destroy
    respond_to do |format|
      format.html { redirect_to caboacessos_url, notice: 'Caboacesso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caboacesso
      @caboacesso = Caboacesso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caboacesso_params
      params.require(:caboacesso).permit(:site_id, :dgo_id, :cod, :comprimento, :qtd_fibras)
    end

    def preparar_form
      @sites = Site.order :nome
      @dgos = Dgo.order :cod
    end
end
