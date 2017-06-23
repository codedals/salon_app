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

ActiveRecord::Schema.define(version: 20170312080024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",       precision: 11, scale: 2
    t.string   "description"
    t.integer  "type"
    t.integer  "salon_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "salon_images", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.integer  "type"
    t.integer  "salon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salons", force: :cascade do |t|
    t.string   "name"
    t.string   "main_image_url"
    t.string   "description"
    t.string   "location"
    t.string   "categories",                    array: true
    t.string   "services",                      array: true
    t.boolean  "active"
    t.boolean  "listed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "franchise_id"
    t.integer  "owner_id"
    t.string   "amenities",                     array: true
    t.string   "key_product_list",              array: true
    t.string   "ambience",                      array: true
    t.string   "specialities",                  array: true
    t.string   "payment_options",               array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
