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

ActiveRecord::Schema.define(version: 20190806210637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.date "date_attended"
    t.boolean "deleted", default: false
    t.bigint "user_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "date_attended"], name: "index_attendances_on_customer_id_and_date_attended", unique: true
    t.index ["customer_id"], name: "index_attendances_on_customer_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "customers", force: :cascade do |t|
    t.string "slug"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "gender"
    t.date "date_of_birth"
    t.date "date_joined"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "title"
    t.string "company_name"
    t.string "company_address"
    t.string "nationality"
    t.text "goals", default: [], array: true
    t.index ["slug"], name: "index_customers_on_slug"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "plan_type"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "receipt_number"
    t.string "mode_of_payment"
    t.date "start_date"
    t.date "end_date"
    t.decimal "amount_paid"
    t.decimal "balance"
    t.decimal "discount"
    t.string "status"
    t.bigint "customer_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
    t.string "prepared_by"
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "avatar"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "attendances", "customers"
  add_foreign_key "attendances", "users"
  add_foreign_key "subscriptions", "customers"
  add_foreign_key "subscriptions", "plans"
end
