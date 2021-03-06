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

ActiveRecord::Schema.define(:version => 20110328151514) do

  create_table "data_files", :force => true do |t|
    t.string   "domain"
    t.text     "datagovuk_uri"
    t.string   "title"
    t.string   "agency"
    t.string   "entity_from_title"
    t.string   "spend_over"
    t.string   "department"
    t.integer  "web_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "origin"
  end

  add_index "data_files", ["origin"], :name => "index_data_files_on_origin"
  add_index "data_files", ["web_resource_id"], :name => "index_data_files_on_web_resource_id"

  create_table "web_resources", :force => true do |t|
    t.string   "name"
    t.string   "uri_md5"
    t.text     "uri"
    t.string   "last_modified"
    t.string   "etag"
    t.text     "file_path"
    t.integer  "response_code"
    t.string   "content_type"
    t.integer  "content_length"
    t.text     "response_header"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "parses_as_csv"
    t.boolean  "blank_rows"
    t.text     "first_row"
    t.boolean  "headers_in_first_row"
    t.string   "parse_error"
    t.boolean  "parse_attempted"
  end

  add_index "web_resources", ["uri_md5"], :name => "index_web_resources_on_uri_md5"

end
