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

ActiveRecord::Schema.define(:version => 20130315103924) do

  create_table "munis", :force => true do |t|
    t.string  "name"
    t.string  "map"
    t.integer "people"
    t.integer "agglo"
  end

  create_table "numbers", :force => true do |t|
    t.integer "muni_id"
    t.integer "type_id"
    t.integer "year"
    t.decimal "value"
  end

  add_index "numbers", ["muni_id", "type_id"], :name => "index_numbers_on_muni_id_and_type_id"

  create_table "types", :force => true do |t|
    t.string "name"
    t.string "unit"
    t.text   "text"
  end

end
