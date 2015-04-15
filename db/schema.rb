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

ActiveRecord::Schema.define(:version => 20150415182207) do

  create_table "add_alig_params", :force => true do |t|
    t.string   "aliParameters"
    t.string   "genome"
    t.string   "param1"
    t.string   "param2"
    t.integer  "pipelines_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alignparams", :force => true do |t|
    t.string   "genome"
    t.string   "param1"
    t.string   "param2"
    t.integer  "pipeline_id"
    t.integer  "paired"
    t.string   "ctrlfile1"
    t.string   "ctrlfile2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "analyses", :force => true do |t|
    t.integer  "encrypted_id"
    t.string   "title"
    t.string   "details"
    t.integer  "user_id"
    t.boolean  "enable"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "pipeline_id"
    t.string   "file"
    t.integer  "filetype"
    t.integer  "size"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "models", ["email"], :name => "index_models_on_email", :unique => true
  add_index "models", ["reset_password_token"], :name => "index_models_on_reset_password_token", :unique => true

  create_table "pipelines", :force => true do |t|
    t.integer  "analysis_id"
    t.string   "name"
    t.text     "comments"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pipesteps", :force => true do |t|
    t.integer  "pipeline_id"
    t.string   "stepName"
    t.string   "libraryName"
    t.string   "parameters"
    t.string   "lib1"
    t.string   "param1"
    t.string   "lib2"
    t.string   "param2"
    t.string   "lib3"
    t.string   "param3"
    t.string   "lib4"
    t.string   "param4"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "paired"
    t.string   "ctrlfile1"
    t.string   "ctrlfile2"
    t.integer  "trim_minQuality"
    t.integer  "trim_firstBase"
    t.integer  "trim_minLength"
    t.string   "trim_library"
    t.string   "trim_function"
    t.string   "trim_param"
    t.string   "refgenome"
  end

  create_table "step_qas", :force => true do |t|
    t.integer "pipeline_id"
    t.integer "minQuality"
    t.integer "firstBase"
    t.integer "minLength"
    t.integer "trimL"
    t.integer "trimR"
    t.integer "parm1"
    t.integer "truncateStartBases"
    t.integer "truncateEndBases"
    t.integer "Lpattern"
    t.integer "Rpattern"
    t.integer "maxLmismatch"
    t.integer "maxRmismatch"
    t.integer "created_at",         :null => false
    t.integer "updated_at",         :null => false
  end

  create_table "step_qas_bkp", :force => true do |t|
    t.integer  "pipeline_id"
    t.integer  "minQuality"
    t.integer  "firstBase"
    t.integer  "minLength"
    t.integer  "trimL"
    t.integer  "trimR"
    t.string   "parm1"
    t.integer  "truncateStartBases"
    t.integer  "truncateEndBases"
    t.string   "Lpattern"
    t.string   "Rpattern"
    t.integer  "maxLmismatch"
    t.integer  "maxRmismatch"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "step_rms", :force => true do |t|
    t.integer  "pipeline_id"
    t.string   "genome"
    t.integer  "paired"
    t.string   "ctrfile1"
    t.string   "ctrfile2"
    t.string   "gtf_file"
    t.string   "param1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "step_trans", :force => true do |t|
    t.integer  "pipeline_id"
    t.string   "gff_file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", :force => true do |t|
    t.integer  "project_id"
    t.string   "file"
    t.integer  "size"
    t.string   "filetype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fileName"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.boolean  "administrator"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_bkp", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator"
    t.text     "first_name"
  end

  add_index "users_bkp", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users_bkp", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
