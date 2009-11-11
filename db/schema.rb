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

ActiveRecord::Schema.define(:version => 20091110200838) do
  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "changes"
    t.integer  "version",        :default => 0
    t.datetime "created_at"
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "conditions", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "google_url"
    t.text     "wiki_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editransactions", :force => true do |t|
    t.string   "isa01",      :limit => 2,  :null => false
    t.string   "isa02",      :limit => 10, :null => false
    t.string   "isa03",      :limit => 2
    t.string   "isa04",      :limit => 10
    t.string   "isa05",      :limit => 2
    t.string   "isa06",      :limit => 15
    t.string   "isa07",      :limit => 2
    t.string   "isa08",      :limit => 15
    t.string   "isa09",      :limit => 6
    t.string   "isa10",      :limit => 4
    t.string   "isa11",      :limit => 1
    t.string   "isa12",      :limit => 5
    t.string   "isa13",      :limit => 9
    t.string   "isa14",      :limit => 1
    t.string   "isa15",      :limit => 1
    t.string   "isa16",      :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "patient_conditions", :force => true do |t|
    t.integer  "patient_profile_id"
    t.integer  "condition_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "treated_by"
    t.text     "treat_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_profiles", :force => true do |t|
    t.integer  "pmd_patient_id",                  :null => false
    t.integer  "pmd_user_id",                     :null => false
    t.integer  "physician_id",                    :null => false
    t.string   "first_name",                      :null => false
    t.string   "last_name",                       :null => false
    t.string   "primary_address"
    t.string   "alternate_address"
    t.integer  "zip5",              :limit => 8
    t.integer  "zip4"
    t.string   "city",              :limit => 60
    t.string   "state_province",    :limit => 2
    t.string   "email",                           :null => false
    t.string   "phone_home",        :limit => 10
    t.string   "phone_mobile",      :limit => 10
    t.string   "phone_work",        :limit => 10
    t.string   "phone_fax",         :limit => 10
    t.string   "phone_emergency",   :limit => 10
    t.date     "date_of_birth",                   :null => false
    t.string   "gender",            :limit => 1,  :null => false
    t.string   "ethnicity",         :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "blood_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_addresses", :force => true do |t|
    t.string   "zip5",       :limit => 5,  :null => false
    t.string   "state",      :limit => 2,  :null => false
    t.string   "city",       :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_ethnicities", :force => true do |t|
    t.string   "description", :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_filter_states", :force => true do |t|
    t.string   "state",       :limit => 2,  :null => false
    t.string   "description", :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email",              :default => "", :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",        :default => 0,  :null => false
    t.integer  "failed_login_count", :default => 0,  :null => false

    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "openid_identifier"
    t.string   "perishable_token",   :default => "", :null => false
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
