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

ActiveRecord::Schema.define(:version => 20120806231145) do

  create_table "mobs", :force => true do |t|
    t.string   "mob_name"
    t.integer  "mob_damage"
    t.integer  "mob_armor"
    t.integer  "mob_gold"
    t.integer  "mob_max_hp"
    t.integer  "mob_cur_hp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "mob_hit"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "weapon"
    t.integer  "armor"
    t.integer  "gold"
    t.integer  "action"
    t.integer  "cur_hp"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "player_hit"
  end

end
