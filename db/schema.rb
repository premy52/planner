# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_21_182626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "caption"
    t.integer "pub_year"
    t.integer "pub_month"
    t.integer "publication_id"
    t.integer "topic_id"
    t.integer "super_topic_id"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_articles_on_publication_id"
    t.index ["super_topic_id"], name: "index_articles_on_super_topic_id"
    t.index ["topic_id"], name: "index_articles_on_topic_id"
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.string "client_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", id: :serial, force: :cascade do |t|
    t.string "pub_name"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_publications_on_client_id"
  end

  create_table "super_topics", id: :serial, force: :cascade do |t|
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "caption"
    t.integer "super_topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["super_topic_id"], name: "index_topics_on_super_topic_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "articles", "publications"
  add_foreign_key "articles", "super_topics"
  add_foreign_key "articles", "topics"
  add_foreign_key "publications", "clients"
  add_foreign_key "topics", "super_topics"
end
