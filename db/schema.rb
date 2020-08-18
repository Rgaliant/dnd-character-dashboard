# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_18_040449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_scores", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "full_name"
    t.text "desc", default: [], array: true
    t.text "skills", default: [], array: true
    t.string "external_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "char_classes", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "hit_die"
    t.string "proficiency_choices"
    t.bigint "proficiency_id", null: false
    t.text "saving_throws"
    t.text "starting_equipment"
    t.text "class_levels"
    t.text "spellcasting"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proficiency_id"], name: "index_char_classes_on_proficiency_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "backstory"
    t.integer "level"
    t.integer "experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "level"
    t.bigint "char_class_id", null: false
    t.bigint "sub_char_class_id", null: false
    t.text "desc", default: [], array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["char_class_id"], name: "index_features_on_char_class_id"
    t.index ["sub_char_class_id"], name: "index_features_on_sub_char_class_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "type"
    t.text "typical_speakers", default: [], array: true
    t.string "script"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "type"
    t.string "name"
    t.text "classes", default: [], array: true
    t.text "races", default: [], array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.integer "speed"
    t.text "ability_bonuses"
    t.text "alignment"
    t.string "age"
    t.string "size"
    t.string "size_description"
    t.bigint "proficiency_id", null: false
    t.bigint "language_id", null: false
    t.text "language_desc"
    t.text "traits"
    t.text "subraces"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_races_on_language_id"
    t.index ["proficiency_id"], name: "index_races_on_proficiency_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.text "desc", default: [], array: true
    t.text "ability_score", default: [], array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_char_classes", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.bigint "char_class_id", null: false
    t.string "name"
    t.string "sub_char_class_flavor"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["char_class_id"], name: "index_sub_char_classes_on_char_class_id"
  end

  add_foreign_key "char_classes", "proficiencies"
  add_foreign_key "features", "char_classes"
  add_foreign_key "features", "sub_char_classes"
  add_foreign_key "races", "languages"
  add_foreign_key "races", "proficiencies"
  add_foreign_key "sub_char_classes", "char_classes"
end
