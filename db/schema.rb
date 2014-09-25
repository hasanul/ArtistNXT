# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140311114334) do

  create_table "admin_news", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "published"
    t.integer  "hits"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "updated_by"
    t.integer  "ordering"
  end

  create_table "artist_fans", force: true do |t|
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audios", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "desc"
    t.text     "path"
    t.boolean  "published"
    t.integer  "hits"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_free"
    t.decimal  "price",           precision: 10, scale: 0
    t.boolean  "is_downloadable"
  end

  add_index "audios", ["user_id"], name: "index_audios_on_user_id", using: :btree

  create_table "audios_music_categories", force: true do |t|
    t.integer  "music_category_id"
    t.integer  "audio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audios_music_categories", ["audio_id"], name: "index_audios_music_categories_on_audio_id", using: :btree
  add_index "audios_music_categories", ["music_category_id"], name: "index_audios_music_categories_on_music_category_id", using: :btree

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.string   "product_name"
    t.integer  "quantity"
    t.decimal  "product_price",       precision: 10, scale: 0
    t.decimal  "product_final_price", precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.string   "cart_number"
    t.decimal  "cart_total",  precision: 10, scale: 0
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commented_by_name"
  end

  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "contents", force: true do |t|
    t.string   "title"
    t.string   "alias"
    t.text     "text"
    t.boolean  "published"
    t.integer  "hits"
    t.integer  "ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
  end

  create_table "countries", force: true do |t|
    t.string   "country_name"
    t.string   "country_3_code"
    t.string   "country_2_code"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "desc"
    t.text     "event_image"
    t.boolean  "published"
    t.boolean  "featured"
    t.integer  "hits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "location"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "friends", force: true do |t|
    t.integer  "sender_id"
    t.text     "receiver_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "userid"
    t.integer  "subscr_id"
    t.boolean  "active"
    t.string   "invoice_number"
    t.datetime "created_date"
    t.datetime "transaction_date"
    t.integer  "used_plan"
    t.string   "method"
    t.decimal  "amount",           precision: 10, scale: 0
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "music_categories", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordering"
    t.boolean  "show_at_home_page"
  end

  create_table "music_categories_videos", force: true do |t|
    t.integer  "music_category_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "desc"
    t.text     "news_image"
    t.boolean  "published"
    t.boolean  "featured"
    t.integer  "hits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news", ["user_id"], name: "index_news_on_user_id", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.string   "product_name"
    t.integer  "product_quantity"
    t.decimal  "product_item_price",  precision: 10, scale: 0
    t.decimal  "product_tax",         precision: 10, scale: 0
    t.decimal  "product_final_price", precision: 10, scale: 0
    t.integer  "order_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "unique_key"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "order_number"
    t.decimal  "order_subtotal", precision: 10, scale: 0
    t.decimal  "order_tax",      precision: 10, scale: 0
    t.decimal  "order_total",    precision: 10, scale: 0
    t.integer  "order_status"
    t.text     "customer_note"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_currency"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.boolean  "is_free"
    t.decimal  "price",                  precision: 10, scale: 2
    t.integer  "period"
    t.string   "period_unit", limit: 50
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordering"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "settings", force: true do |t|
    t.string   "paypal_merchant_email"
    t.string   "sandbox_merchant_email"
    t.boolean  "sandbox"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slides", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.boolean  "published"
    t.text     "slide_image"
    t.integer  "ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.integer  "country_id"
    t.string   "state_name"
    t.string   "state_3_code"
    t.string   "state_2_code"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "userid"
    t.string   "subscr_method"
    t.string   "status"
    t.datetime "signup_date"
    t.datetime "lastpay_date"
    t.datetime "cancel_date"
    t.integer  "plan"
    t.boolean  "recurring"
    t.boolean  "lifetime"
    t.datetime "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
    t.integer  "plan_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "music_info"
    t.integer  "music_catid"
    t.text     "music_desc"
    t.boolean  "music_label"
    t.string   "profile_photo"
    t.string   "music_source_local"
    t.string   "music_source_youtube"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city"
    t.string   "zip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.text     "biography"
    t.integer  "hits"
    t.boolean  "featured"
    t.string   "role"
    t.integer  "lastlogintime"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "avatar_url"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_favorites", force: true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_watches", force: true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.text     "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "desc"
    t.text     "path"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured"
    t.integer  "hits"
    t.text     "thumb"
    t.string   "source"
    t.string   "remote_path"
  end

  add_index "videos", ["remote_path"], name: "index_videos_on_remote_path", using: :btree
  add_index "videos", ["source"], name: "index_videos_on_source", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

  create_table "videos_music_categories", force: true do |t|
    t.integer  "music_category_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
