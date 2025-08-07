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

ActiveRecord::Schema[8.0].define(version: 2025_08_07_143057) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "borrowers", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "address"
    t.string "phone"
    t.string "nid_number"
    t.string "nid_document"
    t.string "father_name"
    t.string "father_nid_number"
    t.string "father_nid_document"
    t.string "mother_name"
    t.string "mother_nid_number"
    t.string "mother_nid_document"
    t.string "spouse_name"
    t.string "spouse_phone"
    t.string "spouse_nid_number"
    t.string "spouse_nid_document"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_status", default: "pending"
    t.index ["manager_id"], name: "index_borrowers_on_manager_id"
  end

  create_table "guarantors", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "address"
    t.string "nid_number"
    t.string "nid_document"
    t.string "phone_number"
    t.bigint "borrower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borrower_id"], name: "index_guarantors_on_borrower_id"
  end

  create_table "installments", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.decimal "amount"
    t.integer "collected_by_id"
    t.datetime "collected_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "installment_status", default: "unpaid"
    t.index ["loan_id"], name: "index_installments_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "amount"
    t.integer "installment_number"
    t.decimal "installment_amount"
    t.integer "grace_period_days"
    t.date "first_installment_date"
    t.date "last_installment_date"
    t.date "final_installment_date"
    t.string "security_type"
    t.text "security_details"
    t.string "stamp_sl"
    t.string "installment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "loan_status"
    t.bigint "borrower_id"
    t.bigint "guarantor_id"
    t.index ["borrower_id"], name: "index_loans_on_borrower_id"
    t.index ["guarantor_id"], name: "index_loans_on_guarantor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "borrowers", "users", column: "manager_id"
  add_foreign_key "guarantors", "borrowers"
  add_foreign_key "installments", "loans"
  add_foreign_key "loans", "borrowers"
  add_foreign_key "loans", "guarantors"
end
