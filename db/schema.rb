# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170503214813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caboacessos", force: :cascade do |t|
    t.string  "cod"
    t.float   "comprimento"
    t.integer "qtd_fibras"
    t.integer "site_id"
    t.integer "dgo_id"
    t.index ["site_id"], name: "index_caboacessos_on_site_id", using: :btree
  end

  create_table "caixaemendas", force: :cascade do |t|
    t.string   "cod"
    t.string   "fabricante"
    t.string   "tipo"
    t.string   "infra"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "num_desenho"
    t.boolean  "acesso"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.index ["caixaemenda_id"], name: "index_caixasubs_on_caixaemenda_id", using: :btree
    t.index ["reserva_id"], name: "index_caixasubs_on_reserva_id", using: :btree
  end

  create_table "caixasubs_trechos", id: false, force: :cascade do |t|
    t.integer "caixasub_id", null: false
    t.integer "trecho_id",   null: false
    t.index ["caixasub_id", "trecho_id"], name: "index_caixasubs_trechos_on_caixasub_id_and_trecho_id", using: :btree
    t.index ["trecho_id", "caixasub_id"], name: "index_caixasubs_trechos_on_trecho_id_and_caixasub_id", using: :btree
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "ativa",      default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "conexoes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "segmento_id"
    t.integer  "caixaemenda_id"
    t.integer  "caboacesso_id"
    t.integer  "dgo_origem_id"
    t.integer  "dgo_site_id"
    t.integer  "switch_origem_id"
    t.integer  "switch_site_id"
    t.integer  "site_id"
    t.integer  "concentrador_id"
    t.integer  "gbic_origem_id"
    t.integer  "gbic_site_id"
    t.index ["caboacesso_id"], name: "index_conexoes_on_caboacesso_id", using: :btree
    t.index ["caixaemenda_id"], name: "index_conexoes_on_caixaemenda_id", using: :btree
    t.index ["concentrador_id"], name: "index_conexoes_on_concentrador_id", using: :btree
    t.index ["dgo_origem_id"], name: "index_conexoes_on_dgo_origem_id", using: :btree
    t.index ["dgo_site_id"], name: "index_conexoes_on_dgo_site_id", using: :btree
    t.index ["gbic_origem_id"], name: "index_conexoes_on_gbic_origem_id", using: :btree
    t.index ["gbic_site_id"], name: "index_conexoes_on_gbic_site_id", using: :btree
    t.index ["segmento_id"], name: "index_conexoes_on_segmento_id", using: :btree
    t.index ["site_id"], name: "index_conexoes_on_site_id", using: :btree
    t.index ["switch_origem_id"], name: "index_conexoes_on_switch_origem_id", using: :btree
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
    t.index ["site_id"], name: "index_contatos_on_site_id", using: :btree
  end

  create_table "dgos", force: :cascade do |t|
    t.string  "cod"
    t.string  "fabricante"
    t.integer "qtd_portas"
    t.integer "segmento_id"
    t.integer "site_id"
    t.index ["segmento_id"], name: "index_dgos_on_segmento_id", using: :btree
    t.index ["site_id"], name: "index_dgos_on_site_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "responsavel_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["responsavel_id"], name: "index_emails_on_responsavel_id", using: :btree
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "cep"
    t.string   "cidade"
    t.string   "estado"
    t.string   "bairro"
    t.string   "endereco"
    t.integer  "instituicao_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["instituicao_id"], name: "index_enderecos_on_instituicao_id", using: :btree
  end

  create_table "fibras", force: :cascade do |t|
    t.integer "numero"
    t.string  "grupo"
    t.string  "cor"
    t.string  "situacao"
    t.string  "proprietario"
    t.string  "info"
    t.integer "tubeloose_id"
    t.integer "portadgo_id"
    t.index ["portadgo_id"], name: "index_fibras_on_portadgo_id", using: :btree
    t.index ["tubeloose_id"], name: "index_fibras_on_tubeloose_id", using: :btree
  end

  create_table "fibras_uplinks", id: false, force: :cascade do |t|
    t.integer "fibra_id",  null: false
    t.integer "uplink_id", null: false
    t.index ["fibra_id", "uplink_id"], name: "index_fibras_uplinks_on_fibra_id_and_uplink_id", using: :btree
    t.index ["uplink_id", "fibra_id"], name: "index_fibras_uplinks_on_uplink_id_and_fibra_id", using: :btree
  end

  create_table "fusoes", force: :cascade do |t|
    t.integer "fibra_id"
    t.integer "fibra2_id"
    t.integer "conexao_id"
    t.index ["fibra2_id"], name: "index_fusoes_on_fibra2_id", using: :btree
    t.index ["fibra_id", "fibra2_id"], name: "index_fusoes_on_fibra_id_and_fibra2_id", unique: true, using: :btree
    t.index ["fibra_id"], name: "index_fusoes_on_fibra_id", using: :btree
  end

  create_table "gbics", force: :cascade do |t|
    t.string  "serie"
    t.string  "patrimonio"
    t.string  "tipo"
    t.integer "porta_slot_id"
    t.index ["porta_slot_id"], name: "index_gbics_on_porta_slot_id", using: :btree
  end

  create_table "geradores", force: :cascade do |t|
    t.string  "patrimonio"
    t.integer "potencia"
    t.string  "fabricante"
    t.integer "site_id"
    t.index ["site_id"], name: "index_geradores_on_site_id", using: :btree
  end

  create_table "incidentes", force: :cascade do |t|
    t.string   "cod"
    t.datetime "data"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "responsavel"
    t.integer  "trecho_id"
    t.index ["trecho_id"], name: "index_incidentes_on_trecho_id", using: :btree
  end

  create_table "instituicoes", force: :cascade do |t|
    t.string   "nome"
    t.integer  "categoria_id"
    t.string   "sigla",          limit: 100
    t.string   "cnpj",           limit: 35
    t.date     "data_aprovacao"
    t.text     "resumo"
    t.string   "site"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "se_ativa",                   default: true
    t.index ["categoria_id"], name: "index_instituicoes_on_categoria_id", using: :btree
  end

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
    t.index ["site_id"], name: "index_nobreaks_on_site_id", using: :btree
  end

  create_table "porta_slots", force: :cascade do |t|
    t.string  "porta"
    t.string  "tipo"
    t.integer "slot_id"
    t.index ["slot_id"], name: "index_porta_slots_on_slot_id", using: :btree
  end

  create_table "portadgos", force: :cascade do |t|
    t.string  "cod"
    t.string  "tipo_conexao"
    t.integer "gbic_id"
    t.integer "dgo_id"
    t.index ["dgo_id"], name: "index_portadgos_on_dgo_id", using: :btree
    t.index ["gbic_id"], name: "index_portadgos_on_gbic_id", using: :btree
  end

  create_table "postes", force: :cascade do |t|
    t.string  "cod"
    t.string  "latitude"
    t.string  "longitude"
    t.integer "reserva_id"
    t.integer "caixaemenda_id"
    t.index ["caixaemenda_id"], name: "index_postes_on_caixaemenda_id", using: :btree
    t.index ["reserva_id"], name: "index_postes_on_reserva_id", using: :btree
  end

  create_table "postes_trechos", id: false, force: :cascade do |t|
    t.integer "poste_id",  null: false
    t.integer "trecho_id", null: false
    t.index ["poste_id", "trecho_id"], name: "index_postes_trechos_on_poste_id_and_trecho_id", using: :btree
    t.index ["trecho_id", "poste_id"], name: "index_postes_trechos_on_trecho_id_and_poste_id", using: :btree
  end

  create_table "repasse_categorias", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "ativa",      default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.string "cod"
    t.float  "comprimento"
    t.string "latitude"
    t.string "longitude"
  end

  create_table "responsaveis", force: :cascade do |t|
    t.integer  "responsavel_tipo_id"
    t.string   "cargo"
    t.string   "nome"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "instituicao_id"
    t.index ["instituicao_id"], name: "index_responsaveis_on_instituicao_id", using: :btree
    t.index ["responsavel_tipo_id"], name: "index_responsaveis_on_responsavel_tipo_id", using: :btree
  end

  create_table "responsavel_tipos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segmentos", force: :cascade do |t|
    t.integer "numero"
    t.decimal "comprimento"
  end

  create_table "sites", force: :cascade do |t|
    t.string  "nome"
    t.string  "latitude"
    t.string  "longitude"
    t.string  "largura_banda"
    t.string  "tipo"
    t.integer "instituicao_id"
    t.index ["instituicao_id"], name: "index_sites_on_instituicao_id", using: :btree
  end

  create_table "slots", force: :cascade do |t|
    t.string  "serie"
    t.integer "numero"
    t.string  "patrimonio"
    t.string  "qtd_portas"
    t.string  "banda"
    t.integer "switch_id"
    t.index ["switch_id"], name: "index_slots_on_switch_id", using: :btree
  end

  create_table "switches", force: :cascade do |t|
    t.string  "serie"
    t.string  "fabricante"
    t.integer "qtd_slots"
    t.string  "patrimonio"
    t.integer "site_id"
    t.index ["site_id"], name: "index_switches_on_site_id", using: :btree
  end

  create_table "telefones", force: :cascade do |t|
    t.string   "numero"
    t.integer  "responsavel_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["responsavel_id"], name: "index_telefones_on_responsavel_id", using: :btree
  end

  create_table "trechos", force: :cascade do |t|
    t.string   "cod"
    t.float    "comprimento"
    t.date     "ano_fabricacao"
    t.string   "infra"
    t.string   "proprietario"
    t.string   "fabricante"
    t.string   "tipo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "acesso"
    t.integer  "dgo_id"
    t.integer  "segmento_id"
    t.integer  "caboacesso_id"
    t.index ["caboacesso_id"], name: "index_trechos_on_caboacesso_id", using: :btree
    t.index ["dgo_id"], name: "index_trechos_on_dgo_id", using: :btree
    t.index ["segmento_id"], name: "index_trechos_on_segmento_id", using: :btree
  end

  create_table "tubelooses", force: :cascade do |t|
    t.integer "numero"
    t.integer "trecho_id"
    t.index ["trecho_id"], name: "index_tubelooses_on_trecho_id", using: :btree
  end

  create_table "uplinks", force: :cascade do |t|
    t.string  "cod"
    t.string  "nome_vlan"
    t.integer "banda"
  end

  create_table "usuarios", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "ativo"
    t.string   "nome"
    t.string   "telefone"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "emails", "responsaveis"
  add_foreign_key "enderecos", "instituicoes"
  add_foreign_key "fusoes", "fibras"
  add_foreign_key "fusoes", "fibras", column: "fibra2_id"
  add_foreign_key "jumpers", "portadgos"
  add_foreign_key "jumpers", "portadgos", column: "portadgo2_id"
  add_foreign_key "responsaveis", "instituicoes"
  add_foreign_key "responsaveis", "responsavel_tipos"
end
