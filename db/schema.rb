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

ActiveRecord::Schema.define(version: 20170309142817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "ativa",      default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "complementos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "telefone"
    t.integer  "usuario_id"
    t.boolean  "ativo"
    t.index ["usuario_id"], name: "index_complementos_on_usuario_id", using: :btree
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

  create_table "repasse_categorias", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "ativa",      default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  create_table "telefones", force: :cascade do |t|
    t.string   "numero"
    t.integer  "responsavel_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["responsavel_id"], name: "index_telefones_on_responsavel_id", using: :btree
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

  add_foreign_key "complementos", "usuarios"
  add_foreign_key "emails", "responsaveis"
  add_foreign_key "enderecos", "instituicoes"
  add_foreign_key "responsaveis", "instituicoes"
  add_foreign_key "responsaveis", "responsavel_tipos"
end
