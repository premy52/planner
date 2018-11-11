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

ActiveRecord::Schema.define(version: 20181021182626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "caption"
    t.integer  "pub_year"
    t.integer  "pub_month"
    t.integer  "publication_id"
    t.integer  "topic_id"
    t.integer  "super_topic_id"
    t.string   "link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publication_id"], name: "index_articles_on_publication_id", using: :btree
    t.index ["super_topic_id"], name: "index_articles_on_super_topic_id", using: :btree
    t.index ["topic_id"], name: "index_articles_on_topic_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "client_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "pub_name"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_publications_on_client_id", using: :btree
  end

  create_table "super_topics", force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "caption"
    t.integer  "super_topic_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["super_topic_id"], name: "index_topics_on_super_topic_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "articles", "publications"
  add_foreign_key "articles", "super_topics"
  add_foreign_key "articles", "topics"
  add_foreign_key "publications", "clients"
  add_foreign_key "topics", "super_topics"
end
