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

ActiveRecord::Schema.define(version: 20180125161710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mollie_customer_id"
    t.string "password_digest"
  end

  create_table "shopping_baskets", force: :cascade do |t|
    t.string "id_token"
    t.integer "member_id"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "submitted_by_customer_at"
    t.string "mollie_customer_id"
    t.string "mollie_payment_id"
    t.string "mollie_payment_method"
    t.string "mollie_payment_status"
    t.string "mollie_payment_amount"
    t.string "mollie_payment_description"
    t.datetime "mollie_payment_created_at"
    t.datetime "mollie_payment_paid_at"
    t.datetime "mollie_payment_cancelled_at"
    t.datetime "mollie_payment_expired_at"
    t.string "mollie_payment_profile_id"
    t.string "mollie_payment_redirect_url"
    t.string "mollie_payment_webhook_url"
    t.string "mollie_consumer_name"
    t.string "mollie_consumer_account"
    t.string "mollie_consumer_bic"
    t.string "mollie_card_holder"
    t.string "mollie_card_number"
    t.string "mollie_card_security"
    t.datetime "mollie_called_at"
    t.datetime "payment_succeeded_at"
    t.string "mollie_payment_url"
    t.index ["id_token"], name: "index_shopping_baskets_on_id_token"
    t.index ["member_id"], name: "index_shopping_baskets_on_member_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.text "lyrics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id"
    t.string "image"
    t.text "lyrics_en"
    t.integer "member_id"
    t.integer "status", default: 0
    t.string "spotify_track_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["member_id"], name: "index_songs_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "role"
    t.string "password_digest"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "members"
end
