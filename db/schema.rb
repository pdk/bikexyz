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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131226090608) do

  create_table "auth_keys", :force => true do |t|
    t.string   "email",      :null => false
    t.string   "key",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bicycles", :force => true do |t|
    t.string   "lookup_code"
    t.string   "owner_name"
    t.string   "owner_alternate_name"
    t.string   "make"
    t.string   "model"
    t.string   "type"
    t.string   "color"
    t.string   "size"
    t.string   "serial"
    t.integer  "gears"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "bike_regs", :force => true do |t|
    t.string   "xyz_code",        :null => false
    t.string   "serial_number"
    t.string   "color"
    t.string   "brand"
    t.string   "model"
    t.string   "kind"
    t.string   "size"
    t.integer  "number_of_gears"
    t.text     "notes"
    t.string   "name"
    t.string   "alternate_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "primary_email"
    t.string   "second_email"
    t.string   "third_email"
    t.string   "cell_phone_one"
    t.string   "cell_phone_two"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "photo_1"
    t.string   "photo_2"
    t.string   "photo_3"
    t.string   "photo_4"
    t.string   "photo_5"
    t.string   "photo_6"
    t.integer  "year"
  end

  add_index "bike_regs", ["xyz_code"], :name => "index_bike_regs_on_xyz_code", :unique => true

# Could not dump table "inbound_emails" because of following StandardError
#   Unknown type 'json' for column 'message_data'

  create_table "lookup_codes", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "xyz_code",   :default => "***", :null => false
  end

  add_index "lookup_codes", ["xyz_code"], :name => "index_lookup_codes_on_xyz_code", :unique => true

  create_table "user_bicycles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bicycle_id"
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "role",                   :default => "user"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
