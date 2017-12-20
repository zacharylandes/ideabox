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

ActiveRecord::Schema.define(version: 20171220012153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Gifs_Ideas", id: false, force: :cascade do |t|
    t.bigint "Idea_id", null: false
    t.bigint "Gif_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "gifs", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "idea_id"
    t.index ["idea_id"], name: "index_gifs_on_idea_id"
  end

  create_table "gifs_ideas", id: false, force: :cascade do |t|
    t.bigint "idea_id", null: false
    t.bigint "gif_id", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "user_id"
    t.bigint "category_id"
    t.bigint "image_id"
    t.index ["category_id"], name: "index_ideas_on_category_id"
    t.index ["image_id"], name: "index_ideas_on_image_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "ideas_images", id: false, force: :cascade do |t|
    t.bigint "idea_id", null: false
    t.bigint "image_id", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.bigint "image_id"
    t.index ["image_id"], name: "index_users_on_image_id"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "gifs", "ideas"
  add_foreign_key "ideas", "categories"
  add_foreign_key "ideas", "images"
  add_foreign_key "ideas", "users"
  add_foreign_key "users", "images"
end
