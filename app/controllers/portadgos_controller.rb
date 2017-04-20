class PortadgosController < ApplicationController
  before_action :set_portadgo, only: [:show, :edit, :update, :destroy]

  # GET /portadgos
  # GET /portadgos.json
  def index
    @portadgos = Portadgo.all
  end

  # GET /portadgos/1
  # GET /portadgos/1.json
  def show
    @conectadas = Fibra.find_by_sql("Select DISTINCT numero from fibras where id in (Select fibra_id from caixaemendas_fibras where caixaemendas_fibras.caixaemenda_id in (SELECT caixaemendas.id from caixaemendas where  cod REGEXP 'EO-09' and acesso = 1));")
  end

  # GET /portadgos/new
  def new
    preparar_form
    @portadgo = Portadgo.new
    if params[:gbic]
      @portadgo.gbic = Gbic.find(params[:gbic])
    end
    if params[:dgo]
      @portadgo.dgo = Dgo.find(params[:dgo])
    end
  end

  # GET /portadgos/1/edit
  def edit
  end

  # POST /portadgos
  # POST /portadgos.json
  def create
    @portadgo = Portadgo.new(portadgo_params)

    respond_to do |format|
      if @portadgo.save
        format.html { redirect_to @portadgo, notice: 'Portadgo was successfully created.' }
        format.json { render :show, status: :created, location: @portadgo }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @portadgo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portadgos/1
  # PATCH/PUT /portadgos/1.json
  def update
    preparar_form
    respond_to do |format|
      if @portadgo.update(portadgo_params)
        format.html { redirect_to @portadgo, notice: 'Portadgo was successfully updated.' }
        format.json { render :show, status: :ok, location: @portadgo }
      else
        format.html { render :edit }
        format.json { render json: @portadgo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portadgos/1
  # DELETE /portadgos/1.json
  def destroy
    @portadgo.destroy
    respond_to do |format|
      format.html { redirect_to portadgos_url, notice: 'Portadgo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def conectar 

    @dgo = Dgo.find(params[:dgo_id])

    @portadgo = Portadgo.find(params[:portadgo_id])
    @trecho = Trecho.find_by(dgo_id: @dgo.id)
    #@tubelooses = Tubeloose.where(trecho_id: @trecho.id)
    #@fibras = Fibra.where(tubeloose_id: [@tubelooses[0].id, @tubelooses[1].id,@tubelooses[2].id,@tubelooses[3].id,@tubelooses[4].id,@tubelooses[5].id,@tubelooses[6].id,@tubelooses[7].id,@tubelooses[8].id,@tubelooses[9].id,@tubelooses[10].id,@tubelooses[11].id])
    @dgos_conectar = Dgo.all
    #@conectadas = Fibra.find_by_sql("Select DISTINCT numero from fibras where id in (Select fibra_id from caixaemendas_fibras where caixaemendas_fibras.caixaemenda_id in (SELECT caixaemendas.id from caixaemendas where  cod REGEXP 'EO-09' and acesso = 1));")
    @ce_conectar = Caixaemenda.find_by_sql("SELECT DISTINCT * from caixaemendas where cod REGEXP 'EO-0#{@dgo.segmento.numero}' and acesso != 1 ")
  end

  def criar_cabo_acesso (cabo_id,dgo_id,seg_id,qnt_trechos, cod_ce, fibra, portadgo)
      i = 1
      j = 1
      @ce = Caixaemenda.find_by(cod: cod_ce)
      @ce.acesso = 1 
      while i <= qnt_trechos.to_i
         m = 0
         @trecho = Trecho.new
         @trecho.segmento_id = seg_id.to_i
         @trecho.caboacesso_id = cabo_id.to_i
         @trecho.acesso = 1
         @qnt_fibras = @trecho.caboacesso.qtd_fibras
         @qnt_tube = @qnt_fibras.to_i/12
      
         @trecho.cod = "acesso"+i.to_s
         if (i == qnt_trechos.to_i)
            @trecho.dgo_id = dgo_id.to_i
         end 
         @trecho.save
         k = 1
         while k <= @qnt_tube.to_i
            @tubeloose = Tubeloose.new
            @tubeloose.numero = k
            @tubeloose.trecho_id = @trecho.id
            @tubeloose.save
            for l in (1..12)
              m = m + 1
              @fibra = Fibra.new
              @fibra.tubeloose_id = @tubeloose.id
              @fibra.numero = m
              @fibra.portadgo_id = 1
              
              if ((m == fibra.to_i) and (i == qnt_trechos))
                @pt_dgo = Portadgo.where(dgo_id: dgo_id.to_i , cod: portadgo.to_i)
                @fibra.portadgo_id = @pt_dgo.id
              end

              if ((m == (fibra.to_i + 1)) and (i == qnt_trechos))
                @pt_dgo = Portadgo.where(dgo_id: dgo_id.to_i , cod: (portadgo.to_i + 1))
                @fibra.portadgo_id = @pt_dgo.id
              end

              @fibra.save

              if ( i == 1)
                if ((m == fibra.to_i) or (m == fibra.to_i + 1))
                  Caixaemenda.connection.insert("INSERT INTO caixaemendas_fibras (caixaemenda_id, fibra_id) VALUES ('#{@ce.id}','#{@fibra.id}')")
                end
              end

            end
            k = k + 1
         end 
         
         if (i == 1)
            Caixaemenda.connection.insert("INSERT INTO caixaemendas_trechos (caixaemenda_id, trecho_id) VALUES ('#{@ce.id}','#{@trecho.id}')")
         end
         if (i > 1 )
           @caixa = Caixaemenda.new
           @caixa.cod = cod_ce+"-0"+j.to_s
           @caixa.acesso = 1
           @caixa.save
           @trecho_ant = @trecho.id - 1
           Caixaemenda.connection.insert("INSERT INTO caixaemendas_trechos (caixaemenda_id, trecho_id) VALUES ('#{@caixa.id}','#{@trecho.id}')")
           Caixaemenda.connection.insert("INSERT INTO caixaemendas_trechos (caixaemenda_id, trecho_id) VALUES ('#{@caixa.id}','#{@trecho_ant}')")
           j = j + 1
         end
         i = i + 1
      end

  end 

  def conf_conexao
    #Ipa.connection.insert("INSERT INTO ipas (nome) VALUES('#{params[:fibras]}')")
    @qnt_trechos = params[:qnt_trechos] 
    @qnt_fibras = params[:qnt_fibras]
    @portadgo = params[:portadgo]
    @fibra = params[:fibra] 
    
    @dgo = Dgo.find_by(id: params[:dgos])
    @ce = Caixaemenda.find_by(id: params[:ce]) 
    @segmento = Segmento.find_by(id: @dgo.segmento_id) 
    @caboacesso = Caboacesso.new
    @caboacesso.ipa_id = @dgo.site.ipa_id
    @caboacesso.dgo_id = @dgo.id
    @caboacesso.qtd_fibras = @qnt_fibras.to_i
    @caboacesso.cod = "Acesso "+@dgo.cod.split("_").first

    @portadgoOrigem = Portadgo.find(params[:portadgo_id])

    @fibraOrigem = Fibra.find_by(numero: @portadgoOrigem.fibra.numero, portadgo_id: @portadgoOrigem.id)
    @trechos = @ce.trechos
  
    #@caboacesso.save
    #criar_cabo_acesso(@caboacesso.id, @caboacesso.dgo_id, @segmento.id, @qnt_trechos, @ce.cod, @fibra, @portadgo)

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portadgo
      @portadgo = Portadgo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portadgo_params
      params.require(:portadgo).permit(:gbic_id, :dgo_id, :cod, :tipo_conexao)
    end
    def preparar_form
      @gbics = Gbic.order :serie
      @jumpers = Jumper.order :id
      @dgos = Dgo.order :cod
    end
end
