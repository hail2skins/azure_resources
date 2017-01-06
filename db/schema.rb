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

ActiveRecord::Schema.define(version: 20170105232228) do

  create_table "blobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "last_modified"
    t.integer  "length"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["last_modified"], name: "index_blobs_on_last_modified", using: :btree
    t.index ["length"], name: "index_blobs_on_length", using: :btree
    t.index ["name"], name: "index_blobs_on_name", using: :btree
  end

  create_table "containers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.boolean  "public_access"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "last_modified"
    t.index ["last_modified"], name: "index_containers_on_last_modified", using: :btree
    t.index ["name"], name: "index_containers_on_name", using: :btree
  end

  create_table "nsgrules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "nsg_name"
    t.string   "direction"
    t.string   "priority"
    t.string   "protocol"
    t.string   "source_port_range"
    t.string   "destination_port_range"
    t.string   "source_address_prefix"
    t.string   "destination_address_prefix"
    t.string   "access"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "nsg_id"
    t.index ["access"], name: "index_nsgrules_on_access", using: :btree
    t.index ["destination_address_prefix"], name: "index_nsgrules_on_destination_address_prefix", using: :btree
    t.index ["destination_port_range"], name: "index_nsgrules_on_destination_port_range", using: :btree
    t.index ["direction"], name: "index_nsgrules_on_direction", using: :btree
    t.index ["name"], name: "index_nsgrules_on_name", using: :btree
    t.index ["nsg_id"], name: "index_nsgrules_on_nsg_id", using: :btree
    t.index ["nsg_name"], name: "index_nsgrules_on_nsg_name", using: :btree
    t.index ["priority"], name: "index_nsgrules_on_priority", using: :btree
    t.index ["protocol"], name: "index_nsgrules_on_protocol", using: :btree
    t.index ["source_address_prefix"], name: "index_nsgrules_on_source_address_prefix", using: :btree
    t.index ["source_port_range"], name: "index_nsgrules_on_source_port_range", using: :btree
  end

  create_table "nsgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_group"
    t.string   "location"
    t.string   "provisioning_state"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "nsgrules_count"
    t.index ["location"], name: "index_nsgs_on_location", using: :btree
    t.index ["name"], name: "index_nsgs_on_name", using: :btree
    t.index ["nsgrules_count"], name: "index_nsgs_on_nsgrules_count", using: :btree
    t.index ["resource_group"], name: "index_nsgs_on_resource_group", using: :btree
  end

  create_table "systems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_group"
    t.string   "availability_set"
    t.string   "operating_system"
    t.string   "vm_size"
    t.string   "operating_system_version"
    t.string   "storage"
    t.string   "subnet"
    t.string   "ip"
    t.string   "nsg"
    t.string   "nsg_resource_group"
    t.string   "location"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["availability_set"], name: "index_systems_on_availability_set", using: :btree
    t.index ["ip"], name: "index_systems_on_ip", using: :btree
    t.index ["location"], name: "index_systems_on_location", using: :btree
    t.index ["name"], name: "index_systems_on_name", using: :btree
    t.index ["nsg"], name: "index_systems_on_nsg", using: :btree
    t.index ["nsg_resource_group"], name: "index_systems_on_nsg_resource_group", using: :btree
    t.index ["operating_system"], name: "index_systems_on_operating_system", using: :btree
    t.index ["operating_system_version"], name: "index_systems_on_operating_system_version", using: :btree
    t.index ["resource_group"], name: "index_systems_on_resource_group", using: :btree
    t.index ["storage"], name: "index_systems_on_storage", using: :btree
    t.index ["subnet"], name: "index_systems_on_subnet", using: :btree
    t.index ["vm_size"], name: "index_systems_on_vm_size", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
