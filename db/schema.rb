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

ActiveRecord::Schema.define(:version => 20130326004712) do

  create_table "data_migrations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "mapping_rules", :force => true do |t|
    t.string   "src_table"
    t.string   "src_column"
    t.string   "dest_table"
    t.string   "dest_column"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "data_migration_id"
  end

  create_table "migration_rules", :force => true do |t|
    t.string   "table_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "data_migration_id"
  end

  create_table "scrapes", :force => true do |t|
    t.string   "name"
    t.string   "dump"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
