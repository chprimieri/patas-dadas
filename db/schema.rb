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

ActiveRecord::Schema.define(version: 2019_11_08_180039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cachorros", force: :cascade do |t|
    t.string "nome"
    t.datetime "data_de_nascimento"
    t.string "sexo"
    t.string "porte"
    t.integer "status"
    t.text "observacoes"
    t.string "equipamento"
    t.integer "frequencia"
    t.integer "duracao"
    t.string "areas"
    t.boolean "disponivel_para_passeio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dupla_id"
    t.index ["dupla_id"], name: "index_cachorros_on_dupla_id"
  end

  create_table "passeios", force: :cascade do |t|
    t.bigint "pessoa_id"
    t.bigint "cachorro_1_id"
    t.bigint "cachorro_2_id"
    t.bigint "cachorro_3_id"
    t.datetime "data_e_hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["cachorro_1_id"], name: "index_passeios_on_cachorro_1_id"
    t.index ["cachorro_2_id"], name: "index_passeios_on_cachorro_2_id"
    t.index ["cachorro_3_id"], name: "index_passeios_on_cachorro_3_id"
    t.index ["pessoa_id"], name: "index_passeios_on_pessoa_id"
  end

  create_table "permissoes", force: :cascade do |t|
    t.bigint "pessoa_id"
    t.boolean "administracao"
    t.boolean "passeio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_permissoes_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.datetime "data_de_nascimento"
    t.string "telefone"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_pessoas_on_email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "passeios", "cachorros", column: "cachorro_1_id"
  add_foreign_key "passeios", "cachorros", column: "cachorro_2_id"
  add_foreign_key "passeios", "cachorros", column: "cachorro_3_id"
  add_foreign_key "passeios", "pessoas"
  add_foreign_key "permissoes", "pessoas"
end
