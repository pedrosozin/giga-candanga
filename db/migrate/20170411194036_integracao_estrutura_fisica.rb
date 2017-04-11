class IntegracaoEstruturaFisica < ActiveRecord::Migration[5.0]

  create_table "caboacessos", force: :cascade do |t|
    t.string  "cod"
    t.float   "comprimento", limit: 24
    t.integer "qtd_fibras"
    t.integer "site_id"
    t.integer "dgo_id"
  end
  add_index :caboacessos, :site_id

  create_table "caixaemendas", force: :cascade do |t|
    t.string   "cod"
    t.string   "fabricante"
    t.string   "tipo"
    t.string   "infra"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "num_desenho"
    t.boolean  "acesso"
    t.timestamps
  end

  create_table "caixaemendas_fibras", id: false, force: :cascade do |t|
    t.integer "fibra_id",       null: false
    t.integer "caixaemenda_id", null: false
    t.index ["caixaemenda_id", "fibra_id"], name: "index_caixaemendas_fibras_on_caixaemenda_id_and_fibra_id", using: :btree
    t.index ["fibra_id", "caixaemenda_id"], name: "index_caixaemendas_fibras_on_fibra_id_and_caixaemenda_id", using: :btree
  end

  create_table "caixaemendas_segmentos", id: false, force: :cascade do |t|
    t.integer "caixaemenda_id", null: false
    t.integer "segmento_id",    null: false
    t.index ["caixaemenda_id", "segmento_id"], name: "index_caixaemendas_segmentos_on_caixaemenda_id_and_segmento_id", using: :btree
    t.index ["segmento_id", "caixaemenda_id"], name: "index_caixaemendas_segmentos_on_segmento_id_and_caixaemenda_id", using: :btree
  end

  create_table "caixaemendas_trechos", id: false, force: :cascade do |t|
    t.integer "caixaemenda_id", null: false
    t.integer "trecho_id",      null: false
    t.index ["caixaemenda_id", "trecho_id"], name: "index_caixaemendas_trechos_on_caixaemenda_id_and_trecho_id", using: :btree
    t.index ["trecho_id", "caixaemenda_id"], name: "index_caixaemendas_trechos_on_trecho_id_and_caixaemenda_id", using: :btree
  end

  create_table "caixasubs", force: :cascade do |t|
    t.string  "cod"
    t.string  "tipo"
    t.string  "infra"
    t.string  "latitude"
    t.string  "longitude"
    t.integer "num_desenho"
    t.string  "tipo_tampa"
    t.integer "reserva_id"
    t.integer "caixaemenda_id"
  end
  add_index :caixasubs, :reserva_id
  add_index :caixasubs, :caixaemenda_id

  create_table "caixasubs_trechos", id: false, force: :cascade do |t|
    t.integer "caixasub_id", null: false
    t.integer "trecho_id",   null: false
    t.index ["caixasub_id", "trecho_id"], name: "index_caixasubs_trechos_on_caixasub_id_and_trecho_id", using: :btree
    t.index ["trecho_id", "caixasub_id"], name: "index_caixasubs_trechos_on_trecho_id_and_caixasub_id", using: :btree
  end

  create_table "contatos", force: :cascade do |t|
    t.string  "nome"
    t.string  "telefone"
    t.string  "telefone2"
    t.string  "telefone3"
    t.string  "tipo"
    t.string  "email"
    t.integer "prioridade"
    t.integer "site_id"
    t.string  "cargo"
  end
  add_index :contatos, :site_id

  create_table "dgos", force: :cascade do |t|
    t.string  "cod"
    t.string  "fabricante"
    t.integer "qtd_portas"
    t.integer "segmento_id"
    t.integer "site_id"
  end
  add_index :dgos, :site_id
  add_index :dgos, :segmento_id

  create_table "fibras", force: :cascade do |t|
    t.integer "numero"
    t.string  "grupo"
    t.string  "cor"
    t.string  "situacao"
    t.string  "proprietario"
    t.string  "info"
    t.integer "tubeloose_id"
    t.integer "portadgo_id"
  end
  add_index :fibras, :tubeloose_id
  add_index :fibras, :portadgo_id

  create_table "fibras_uplinks", id: false, force: :cascade do |t|
    t.integer "fibra_id",  null: false
    t.integer "uplink_id", null: false
    t.index ["fibra_id", "uplink_id"], name: "index_fibras_uplinks_on_fibra_id_and_uplink_id", using: :btree
    t.index ["uplink_id", "fibra_id"], name: "index_fibras_uplinks_on_uplink_id_and_fibra_id", using: :btree
  end

  create_table "fusoes", force: :cascade do |t|
    t.integer "fibra_id"
    t.integer "fibra2_id"
    t.index ["fibra2_id"], name: "index_fusoes_on_fibra2_id", using: :btree
    t.index ["fibra_id", "fibra2_id"], name: "index_fusoes_on_fibra_id_and_fibra2_id", unique: true, using: :btree
    t.index ["fibra_id"], name: "index_fusoes_on_fibra_id", using: :btree
  end

  create_table "gbics", force: :cascade do |t|
    t.string  "serie"
    t.string  "patrimonio"
    t.string  "tipo"
    t.integer "porta_slot_id"
  end
  add_index :gbics, :porta_slot_id

  create_table "geradores", force: :cascade do |t|
    t.string  "patrimonio"
    t.integer "potencia"
    t.string  "fabricante"
    t.integer "site_id"
  end
  add_index :geradores, :site_id

  create_table "incidentes", force: :cascade do |t|
    t.string   "cod"
    t.datetime "data"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "responsavel"
    t.integer  "trecho_id"
  end
  add_index :incidentes, :trecho_id

  create_table "jumpers", force: :cascade do |t|
    t.integer "portadgo_id"
    t.integer "portadgo2_id"
    t.index ["portadgo2_id"], name: "index_jumpers_on_portadgo2_id", using: :btree
    t.index ["portadgo_id", "portadgo2_id"], name: "index_jumpers_on_portadgo_id_and_portadgo2_id", unique: true, using: :btree
    t.index ["portadgo_id"], name: "index_jumpers_on_portadgo_id", using: :btree
  end

  create_table "nobreaks", force: :cascade do |t|
    t.string  "patrimonio"
    t.string  "proprietario"
    t.string  "potencia"
    t.integer "site_id"
  end
  add_index :nobreaks, :site_id

  create_table "porta_slots", force: :cascade do |t|
    t.string  "porta"
    t.string  "tipo"
    t.references :slot
  end

  create_table "portadgos", force: :cascade do |t|
    t.string  "cod"
    t.string  "tipo_conexao"
    t.references :gbic
    t.references :dgo
  end

  create_table "postes", force: :cascade do |t|
    t.string  "cod"
    t.string  "latitude"
    t.string  "longitude"
    t.references :reserva
    t.references :caixaemenda
  end

  create_table "postes_trechos", id: false, force: :cascade do |t|
    t.integer "poste_id",  null: false
    t.integer "trecho_id", null: false
    t.index ["poste_id", "trecho_id"], name: "index_postes_trechos_on_poste_id_and_trecho_id", using: :btree
    t.index ["trecho_id", "poste_id"], name: "index_postes_trechos_on_trecho_id_and_poste_id", using: :btree
  end

  create_table "reservas", force: :cascade do |t|
    t.string "cod"
    t.float  "comprimento", limit: 24
    t.string "latitude"
    t.string "longitude"
  end

  create_table "segmentos", force: :cascade do |t|
    t.integer "numero"
    t.decimal   "comprimento", limit: 24
  end

  create_table "sites", force: :cascade do |t|
    t.string  "nome"
    t.string  "latitude"
    t.string  "longitude"
    t.string  "largura_banda"
    t.string  "tipo"
    t.references :instituicao
  end

  create_table "slots", force: :cascade do |t|
    t.string  "serie"
    t.integer "numero"
    t.string  "patrimonio"
    t.string  "qtd_portas"
    t.string  "banda"
    t.references :switch
  end

  create_table "switches", force: :cascade do |t|
    t.string  "serie"
    t.string  "fabricante"
    t.integer "qtd_slots"
    t.string  "patrimonio"
    t.references :site
  end

  create_table "trechos", force: :cascade do |t|
    t.string   "cod"
    t.float    "comprimento",    limit: 24
    t.date     "ano_fabricacao"
    t.string   "infra"
    t.string   "proprietario"
    t.string   "fabricante"
    t.string   "tipo"
    t.timestamps
    t.boolean  "acesso"
    t.references :dgo
    t.references :segmento
    t.references :caboacesso
  end

  create_table "tubelooses", force: :cascade do |t|
    t.integer "numero"
    t.references :trecho
  end

  create_table "uplinks", force: :cascade do |t|
    t.string  "cod"
    t.string  "nome_vlan"
    t.integer "banda"
  end

  add_foreign_key "fusoes", "fibras"
  add_foreign_key "fusoes", "fibras", column: "fibra2_id"
  add_foreign_key "jumpers", "portadgos"
  add_foreign_key "jumpers", "portadgos", column: "portadgo2_id"

end

