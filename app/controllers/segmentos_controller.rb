class SegmentosController < ApplicationController
  before_action :set_segmento, only: [:show, :edit, :update, :destroy]

  # GET /segmentos
  # GET /segmentos.json
  def index
    @segmentos = Segmento.all
  end

  # GET /segmentos/1
  # GET /segmentos/1.json
  def show
    #@dgos = Dgo.where(segmento_id: params[:id], site.tipo: 1)
    @dgos = Dgo.find_by_sql("SELECT DISTINCT * From dgos  where segmento_id = #{params[:id]} and site_id IN (Select id from sites where tipo = '1');")
    
    count  = 0
    @dgos.each do |t|
      if count < Conexao.where(dgo_origem_id: t.id).count
        count = Conexao.where(dgo_origem_id: t.id).count
        @dgo = t
      end
    end
    @link = "#{params[:id]}/dgos/"
    #@fusoes = Fusao.find_by_sql("SELECT DISTINCT * FROM fusoes where conexao_id IN (Select id from conexoes where dgo_origem_id = #{@dgo.id}); ")
     @fusoes = Fusao.find_by_sql("SELECT DISTINCT * FROM fusoes where conexao_id IN (Select id from conexoes where dgo_origem_id = #{@dgo.id}); ")
  end

  # GET /segmentos/new
  def new
    @segmento = Segmento.new
    @fibras
  end

  # GET /segmentos/1/edit
  def edit
  end

  # POST /segmentos
  # POST /segmentos.json
  def create
    @segmento = Segmento.new(segmento_params)

    respond_to do |format|
      if @segmento.save
        format.html { redirect_to @segmento, notice: 'Segmento was successfully created.' }
        format.json { render :show, status: :created, location: @segmento }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @segmento.errors, status: :unprocessable_entity }
      end
      #ActiveRecord::Base.connection.execute("execute new_procedure")
      #sql.execute "new_procedure (@segmento.id);"
      #DbStoredProcedure.method_name("exec new_procedure")
      @cod = @segmento.numero.to_s 
      ActiveRecord::Base.connection.execute("call cria_trechos (#{@segmento.id}, #{@segmento.comprimento}, #{@cod})")

    end
  end

  # PATCH/PUT /segmentos/1
  # PATCH/PUT /segmentos/1.json
  def update
    preparar_form
    respond_to do |format|
      if @segmento.update(segmento_params)
        format.html { redirect_to @segmento, notice: 'Segmento was successfully updated.' }
        format.json { render :show, status: :ok, location: @segmento }
      else
        format.html { render :edit }
        format.json { render json: @segmento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /segmentos/1
  # DELETE /segmentos/1.json
  def destroy
    @segmento.destroy
    respond_to do |format|
      format.html { redirect_to segmentos_url, notice: 'Segmento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_segmento
      @segmento = Segmento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def segmento_params
      params.require(:segmento).permit(:numero, :comprimento)
    end
    
end
