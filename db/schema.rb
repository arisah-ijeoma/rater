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

ActiveRecord::Schema.define(version: 20170421130058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogo_posts", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "permalink",        null: false
    t.string   "title",            null: false
    t.boolean  "published",        null: false
    t.datetime "published_at",     null: false
    t.string   "markup_lang",      null: false
    t.text     "raw_content",      null: false
    t.text     "html_content",     null: false
    t.text     "html_overview"
    t.string   "tags_string"
    t.string   "meta_description", null: false
    t.string   "meta_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_posts", ["permalink"], name: "index_blogo_posts_on_permalink", unique: true, using: :btree
  add_index "blogo_posts", ["published_at"], name: "index_blogo_posts_on_published_at", using: :btree
  add_index "blogo_posts", ["user_id"], name: "index_blogo_posts_on_user_id", using: :btree

  create_table "blogo_taggings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "blogo_taggings", ["tag_id", "post_id"], name: "index_blogo_taggings_on_tag_id_and_post_id", unique: true, using: :btree

  create_table "blogo_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_tags", ["name"], name: "index_blogo_tags_on_name", unique: true, using: :btree

  create_table "blogo_users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_users", ["email"], name: "index_blogo_users_on_email", unique: true, using: :btree

  create_table "brand_users", force: :cascade do |t|
    t.integer "brand_id"
    t.integer "user_id"
    t.decimal "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.text    "extra_comment"
  end

  add_index "brand_users", ["brand_id"], name: "index_brand_users_on_brand_id", using: :btree
  add_index "brand_users", ["user_id"], name: "index_brand_users_on_user_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "managed_by"
    t.string   "industry"
    t.string   "avatar"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "raters",                                 default: 0,   null: false
    t.integer  "answer_1",                               default: 0,   null: false
    t.integer  "answer_2",                               default: 0,   null: false
    t.integer  "answer_3",                               default: 0,   null: false
    t.integer  "answer_4",                               default: 0,   null: false
    t.integer  "answer_5",                               default: 0,   null: false
    t.integer  "answer_6",                               default: 0,   null: false
    t.integer  "answer_7",                               default: 0,   null: false
    t.integer  "answer_8",                               default: 0,   null: false
    t.integer  "answer_9",                               default: 0,   null: false
    t.integer  "answer_10",                              default: 0,   null: false
    t.text     "extra_comment"
    t.string   "tag"
  end

  create_table "church_users", force: :cascade do |t|
    t.integer "church_id"
    t.integer "user_id"
    t.decimal "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.text    "extra_comment"
  end

  add_index "church_users", ["church_id"], name: "index_church_users_on_church_id", using: :btree
  add_index "church_users", ["user_id"], name: "index_church_users_on_user_id", using: :btree

  create_table "churches", force: :cascade do |t|
    t.string   "name"
    t.string   "aka"
    t.string   "date_founded"
    t.string   "founder"
    t.string   "website"
    t.string   "avatar"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "raters",                                 default: 0,   null: false
    t.integer  "answer_1",                               default: 0,   null: false
    t.integer  "answer_2",                               default: 0,   null: false
    t.integer  "answer_3",                               default: 0,   null: false
    t.integer  "answer_4",                               default: 0,   null: false
    t.integer  "answer_5",                               default: 0,   null: false
    t.integer  "answer_6",                               default: 0,   null: false
    t.integer  "answer_7",                               default: 0,   null: false
    t.integer  "answer_8",                               default: 0,   null: false
    t.integer  "answer_9",                               default: 0,   null: false
    t.integer  "answer_10",                              default: 0,   null: false
    t.text     "extra_comment"
    t.string   "tag"
  end

  create_table "lecturer_users", force: :cascade do |t|
    t.integer "lecturer_id"
    t.integer "user_id"
    t.decimal "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.text    "extra_comment"
  end

  add_index "lecturer_users", ["lecturer_id"], name: "index_lecturer_users_on_lecturer_id", using: :btree
  add_index "lecturer_users", ["user_id"], name: "index_lecturer_users_on_user_id", using: :btree

  create_table "lecturers", force: :cascade do |t|
    t.string   "name"
    t.string   "course"
    t.string   "avatar"
    t.integer  "school_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "raters",                                 default: 0,   null: false
    t.integer  "answer_1",                               default: 0,   null: false
    t.integer  "answer_2",                               default: 0,   null: false
    t.integer  "answer_3",                               default: 0,   null: false
    t.integer  "answer_4",                               default: 0,   null: false
    t.integer  "answer_5",                               default: 0,   null: false
    t.integer  "answer_6",                               default: 0,   null: false
    t.integer  "answer_7",                               default: 0,   null: false
    t.integer  "answer_8",                               default: 0,   null: false
    t.integer  "answer_9",                               default: 0,   null: false
    t.integer  "answer_10",                              default: 0,   null: false
    t.text     "extra_comment"
    t.string   "tag"
  end

  create_table "pastor_users", force: :cascade do |t|
    t.integer "pastor_id"
    t.integer "user_id"
    t.decimal "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.text    "extra_comment"
  end

  add_index "pastor_users", ["pastor_id"], name: "index_pastor_users_on_pastor_id", using: :btree
  add_index "pastor_users", ["user_id"], name: "index_pastor_users_on_user_id", using: :btree

  create_table "pastors", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.integer  "church_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "raters",                                 default: 0,   null: false
    t.integer  "answer_1",                               default: 0,   null: false
    t.integer  "answer_2",                               default: 0,   null: false
    t.integer  "answer_3",                               default: 0,   null: false
    t.integer  "answer_4",                               default: 0,   null: false
    t.integer  "answer_5",                               default: 0,   null: false
    t.integer  "answer_6",                               default: 0,   null: false
    t.integer  "answer_7",                               default: 0,   null: false
    t.integer  "answer_8",                               default: 0,   null: false
    t.integer  "answer_9",                               default: 0,   null: false
    t.integer  "answer_10",                              default: 0,   null: false
    t.text     "extra_comment"
    t.string   "tag"
  end

  create_table "politician_users", force: :cascade do |t|
    t.integer "politician_id"
    t.integer "user_id"
    t.decimal "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.text    "extra_comment"
  end

  add_index "politician_users", ["politician_id"], name: "index_politician_users_on_politician_id", using: :btree
  add_index "politician_users", ["user_id"], name: "index_politician_users_on_user_id", using: :btree

  create_table "politicians", force: :cascade do |t|
    t.string   "name"
    t.string   "current_office"
    t.datetime "date_assumed"
    t.string   "present_party"
    t.string   "former_position"
    t.string   "avatar"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.decimal  "rating",          precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "raters",                                   default: 0,   null: false
    t.integer  "answer_1",                                 default: 0,   null: false
    t.integer  "answer_2",                                 default: 0,   null: false
    t.integer  "answer_3",                                 default: 0,   null: false
    t.integer  "answer_4",                                 default: 0,   null: false
    t.integer  "answer_5",                                 default: 0,   null: false
    t.integer  "answer_6",                                 default: 0,   null: false
    t.integer  "answer_7",                                 default: 0,   null: false
    t.integer  "answer_8",                                 default: 0,   null: false
    t.integer  "answer_9",                                 default: 0,   null: false
    t.integer  "answer_10",                                default: 0,   null: false
    t.text     "extra_comment"
    t.string   "tag"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "full_name",          default: "Anonymous", null: false
    t.string   "avatar"
    t.string   "profession"
    t.string   "course_of_study"
    t.string   "state_of_origin"
    t.string   "state_of_residence"
    t.text     "brief"
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "school_users", force: :cascade do |t|
    t.integer "school_id"
    t.integer "user_id"
    t.decimal "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.text    "extra_comment"
  end

  add_index "school_users", ["school_id"], name: "index_school_users_on_school_id", using: :btree
  add_index "school_users", ["user_id"], name: "index_school_users_on_user_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "aka"
    t.string   "date_founded"
    t.string   "location"
    t.string   "ownership"
    t.string   "category"
    t.string   "head"
    t.string   "website"
    t.string   "avatar"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "rating",        precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "raters",                                 default: 0,   null: false
    t.integer  "answer_1",                               default: 0,   null: false
    t.integer  "answer_2",                               default: 0,   null: false
    t.integer  "answer_3",                               default: 0,   null: false
    t.integer  "answer_4",                               default: 0,   null: false
    t.integer  "answer_5",                               default: 0,   null: false
    t.integer  "answer_6",                               default: 0,   null: false
    t.integer  "answer_7",                               default: 0,   null: false
    t.integer  "answer_8",                               default: 0,   null: false
    t.integer  "answer_9",                               default: 0,   null: false
    t.integer  "answer_10",                              default: 0,   null: false
    t.text     "extra_comment"
    t.string   "tag"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_brand_hearts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "brand_id"
    t.boolean  "like",       default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_brand_hearts", ["brand_id"], name: "index_user_brand_hearts_on_brand_id", using: :btree
  add_index "user_brand_hearts", ["user_id"], name: "index_user_brand_hearts_on_user_id", using: :btree

  create_table "user_church_hearts", force: :cascade do |t|
    t.integer  "church_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "like",       default: false, null: false
  end

  add_index "user_church_hearts", ["church_id"], name: "index_user_church_hearts_on_church_id", using: :btree
  add_index "user_church_hearts", ["user_id"], name: "index_user_church_hearts_on_user_id", using: :btree

  create_table "user_lecturer_hearts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lecturer_id"
    t.boolean  "like",        default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "user_lecturer_hearts", ["lecturer_id"], name: "index_user_lecturer_hearts_on_lecturer_id", using: :btree
  add_index "user_lecturer_hearts", ["user_id"], name: "index_user_lecturer_hearts_on_user_id", using: :btree

  create_table "user_pastor_hearts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pastor_id"
    t.boolean  "like",       default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_pastor_hearts", ["pastor_id"], name: "index_user_pastor_hearts_on_pastor_id", using: :btree
  add_index "user_pastor_hearts", ["user_id"], name: "index_user_pastor_hearts_on_user_id", using: :btree

  create_table "user_politician_hearts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "politician_id"
    t.boolean  "like",          default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "user_politician_hearts", ["politician_id"], name: "index_user_politician_hearts_on_politician_id", using: :btree
  add_index "user_politician_hearts", ["user_id"], name: "index_user_politician_hearts_on_user_id", using: :btree

  create_table "user_school_hearts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.boolean  "like",       default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_school_hearts", ["school_id"], name: "index_user_school_hearts_on_school_id", using: :btree
  add_index "user_school_hearts", ["user_id"], name: "index_user_school_hearts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "phone_number"
    t.string   "account_type",           default: "Anonymous", null: false
    t.boolean  "admin",                  default: false,       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "brand_users", "brands"
  add_foreign_key "brand_users", "users"
  add_foreign_key "church_users", "churches"
  add_foreign_key "church_users", "users"
  add_foreign_key "lecturer_users", "lecturers"
  add_foreign_key "lecturer_users", "users"
  add_foreign_key "pastor_users", "pastors"
  add_foreign_key "pastor_users", "users"
  add_foreign_key "politician_users", "politicians"
  add_foreign_key "politician_users", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "school_users", "schools"
  add_foreign_key "school_users", "users"
  add_foreign_key "user_brand_hearts", "brands"
  add_foreign_key "user_brand_hearts", "users"
  add_foreign_key "user_church_hearts", "churches"
  add_foreign_key "user_church_hearts", "users"
  add_foreign_key "user_lecturer_hearts", "lecturers"
  add_foreign_key "user_lecturer_hearts", "users"
  add_foreign_key "user_pastor_hearts", "pastors"
  add_foreign_key "user_pastor_hearts", "users"
  add_foreign_key "user_politician_hearts", "politicians"
  add_foreign_key "user_politician_hearts", "users"
  add_foreign_key "user_school_hearts", "schools"
  add_foreign_key "user_school_hearts", "users"
end
