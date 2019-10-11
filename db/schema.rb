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

ActiveRecord::Schema.define(version: 20191011172842) do

  create_table "cachorros", force: :cascade do |t|
    t.string   "nome"
    t.datetime "data_de_nascimento"
    t.string   "sexo"
    t.string   "porte"
    t.string   "foto"
    t.string   "status"
    t.text     "observacoes"
    t.string   "equipamento"
    t.integer  "dupla_id"
    t.integer  "frequencia"
    t.integer  "duracao"
    t.string   "areas"
    t.boolean  "disponivel_para_passeio"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "canis", force: :cascade do |t|
    t.integer  "cachorro_id"
    t.string   "corredor"
    t.integer  "numero"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "duplo"
    t.index ["cachorro_id"], name: "index_canis_on_cachorro_id"
  end

  create_table "manutencoes", force: :cascade do |t|
    t.integer  "pessoa_id"
    t.integer  "canil_id"
    t.string   "status"
    t.datetime "data_e_hora"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["canil_id"], name: "index_manutencoes_on_canil_id"
    t.index ["pessoa_id"], name: "index_manutencoes_on_pessoa_id"
  end

  create_table "passeios", force: :cascade do |t|
    t.integer  "pessoa_id"
    t.string   "status"
    t.datetime "data_e_hora"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pessoa_id"], name: "index_passeios_on_pessoa_id"
  end

  create_table "permissoes", force: :cascade do |t|
    t.integer  "pessoa_id"
    t.boolean  "administracao"
    t.boolean  "passeio"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["pessoa_id"], name: "index_permissoes_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "data_de_nascimento"
    t.string   "email"
    t.string   "telefone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_pessoas_on_email"
  end

end
