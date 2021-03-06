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

ActiveRecord::Schema[7.0].define(version: 2022_04_13_152337) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1, null: false
    t.float "amount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "ip"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_enterprises", force: :cascade do |t|
    t.string "commercial_name"
    t.string "business_name"
    t.string "nif"
    t.string "meta_title"
    t.string "meta_description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wide_transfer"
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "instagram_url"
    t.string "bodasnet_url"
    t.string "gramoladisco_url"
  end

  create_table "email_base_templates", force: :cascade do |t|
    t.string "title", null: false
    t.integer "kind", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_custom_templates", force: :cascade do |t|
    t.bigint "email_base_template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_base_template_id"], name: "index_email_custom_templates_on_email_base_template_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "legal_texts", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity", default: 1, null: false
    t.float "amount", null: false
    t.float "discount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.float "total_amount", null: false
    t.float "discount", default: 0.0, null: false
    t.boolean "charge", default: false, null: false
    t.bigint "user_id", null: false
    t.string "name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", null: false
    t.string "dni", null: false
    t.integer "phone", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "region", null: false
    t.integer "zip", null: false
    t.string "country", null: false
    t.string "birthdate", null: false
    t.string "affiliation"
    t.string "tutor_name", default: "", null: false
    t.string "tutor_last_name", default: "", null: false
    t.string "tutor_dni", null: false
    t.string "tutor_phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_fields", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name"
    t.string "field_type"
    t.boolean "required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_fields_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "sku"
    t.decimal "initial_price", precision: 8, scale: 2, null: false
    t.decimal "old_price", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "vat", default: "21.0", null: false
    t.decimal "discount", precision: 8, scale: 2, default: "0.0", null: false
    t.virtual "price", type: :decimal, precision: 8, scale: 2, as: "(initial_price - ((initial_price * discount) / (100)::numeric))", stored: true
    t.virtual "price_no_vat", type: :decimal, precision: 8, scale: 2, as: "((initial_price - ((initial_price * discount) / (100)::numeric)) / ((1)::numeric + (vat / (100)::numeric)))", stored: true
    t.virtual "price_in_cents", type: :integer, as: "((initial_price - ((initial_price * discount) / (100)::numeric)) * (100)::numeric)", stored: true
    t.bigint "category_id", null: false
    t.string "category_name"
    t.boolean "swiper"
    t.boolean "highlight"
    t.boolean "hidden", default: true
    t.integer "position"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "last_name"
    t.integer "phone"
    t.string "dni"
    t.string "stripe_customer_id"
    t.string "stripe_subscription_id"
    t.integer "stripe_price_id"
    t.text "address"
    t.string "city"
    t.integer "zip"
    t.string "region"
    t.string "country"
    t.date "birthdate"
    t.text "avatar_data"
    t.datetime "deleted_at"
    t.string "role", default: "user", null: false
    t.string "encrypted_password", null: false
    t.string "slug"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "email_custom_templates", "email_base_templates"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "users"
  add_foreign_key "product_fields", "products"
  add_foreign_key "products", "categories"
end
