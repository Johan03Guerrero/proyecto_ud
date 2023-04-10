# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_12_004930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conceptos", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periodos", force: :cascade do |t|
    t.string "fecha"
    t.bigint "vigencia_ud_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vigencia_ud_id"], name: "index_periodos_on_vigencia_ud_id"
  end

  create_table "presupuesto_conceptos", force: :cascade do |t|
    t.float "presupuesto_inicial"
    t.float "adicion_modificacion_mes"
    t.float "adicion_modificacion_acumulado"
    t.float "presupuesto_definitivo"
    t.float "recaudo_mes"
    t.float "recaudo_acumulado"
    t.float "ejecucion"
    t.float "saldo_por_recaudar"
    t.bigint "concepto_id", null: false
    t.bigint "periodo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concepto_id"], name: "index_presupuesto_conceptos_on_concepto_id"
    t.index ["periodo_id"], name: "index_presupuesto_conceptos_on_periodo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vigencia_uds", force: :cascade do |t|
    t.integer "anho_vigencia_ud"
    t.json "archivo_vigencia_ud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "periodos", "vigencia_uds"
  add_foreign_key "presupuesto_conceptos", "conceptos"
  add_foreign_key "presupuesto_conceptos", "periodos"
end
