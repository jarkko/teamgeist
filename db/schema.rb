# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091108182819) do

  create_table "mistake_places", :force => true do |t|
    t.string   "description"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mistake_types", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mistakes", :force => true do |t|
    t.integer  "control"
    t.integer  "amount"
    t.text     "comments"
    t.integer  "mistake_type_id"
    t.integer  "performance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mistake_place_id"
  end

  add_index "mistakes", ["mistake_place_id"], :name => "index_mistakes_on_place"

  create_table "performances", :force => true do |t|
    t.boolean  "contest"
    t.string   "name"
    t.date     "date"
    t.string   "contest_type"
    t.string   "terrain_type"
    t.string   "place"
    t.string   "map"
    t.string   "scale"
    t.decimal  "length",         :precision => 10, :scale => 4
    t.integer  "time"
    t.integer  "position"
    t.integer  "control_amount"
    t.integer  "runner_amount"
    t.integer  "winning_time"
    t.integer  "priority"
    t.integer  "feeling"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "night"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
