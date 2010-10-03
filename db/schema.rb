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

ActiveRecord::Schema.define(:version => 20101002062951) do

  create_table "iteration_votes", :force => true do |t|
    t.integer  "iteration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iterations", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "turkee_task_id"
  end

  create_table "turkee_imported_assignments", :force => true do |t|
    t.string   "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turkee_imported_assignments", ["assignment_id"], :name => "index_turkee_imported_assignments_on_assignment_id", :unique => true

  create_table "turkee_tasks", :force => true do |t|
    t.string   "hit_url"
    t.boolean  "sandbox"
    t.integer  "task_id"
    t.string   "task_type"
    t.text     "hit_title"
    t.text     "hit_description"
    t.string   "hit_id"
    t.decimal  "hit_reward",          :precision => 10, :scale => 2
    t.integer  "hit_num_assignments"
    t.integer  "hit_lifetime"
    t.string   "form_url"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "form_body"
  end

end
