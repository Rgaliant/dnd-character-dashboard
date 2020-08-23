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

ActiveRecord::Schema.define(version: 2020_08_23_222800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_scores", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "full_name"
    t.integer "level"
    t.text "desc", default: [], array: true
    t.string "external_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "armors", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "equipment_category"
    t.string "armor_category"
    t.string "armor_class"
    t.string "str_minimum"
    t.boolean "stealth_disadvantage"
    t.string "cost"
    t.integer "weight"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "char_classes", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "hit_die"
    t.string "proficiency_choices"
    t.text "saving_throws", default: [], array: true
    t.text "starting_equipment", default: [], array: true
    t.text "class_levels", default: [], array: true
    t.text "spellcasting", default: [], array: true
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "backstory"
    t.integer "level"
    t.integer "experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters_ability_scores", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "ability_score_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_score_id"], name: "index_characters_ability_scores_on_ability_score_id"
    t.index ["character_id"], name: "index_characters_ability_scores_on_character_id"
  end

  create_table "characters_armors", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "armor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["armor_id"], name: "index_characters_armors_on_armor_id"
    t.index ["character_id"], name: "index_characters_armors_on_character_id"
  end

  create_table "characters_char_classes", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "char_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["char_class_id"], name: "index_characters_char_classes_on_char_class_id"
    t.index ["character_id"], name: "index_characters_char_classes_on_character_id"
  end

  create_table "characters_features", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_features_on_character_id"
    t.index ["feature_id"], name: "index_characters_features_on_feature_id"
  end

  create_table "characters_languages", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_languages_on_character_id"
    t.index ["language_id"], name: "index_characters_languages_on_language_id"
  end

  create_table "characters_proficiencies", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_proficiencies_on_character_id"
    t.index ["proficiency_id"], name: "index_characters_proficiencies_on_proficiency_id"
  end

  create_table "characters_races", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_races_on_character_id"
    t.index ["race_id"], name: "index_characters_races_on_race_id"
  end

  create_table "characters_skills", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_skills_on_character_id"
    t.index ["skill_id"], name: "index_characters_skills_on_skill_id"
  end

  create_table "characters_spells", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "spell_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_spells_on_character_id"
    t.index ["spell_id"], name: "index_characters_spells_on_spell_id"
  end

  create_table "characters_sub_char_classes", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "sub_char_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_sub_char_classes_on_character_id"
    t.index ["sub_char_class_id"], name: "index_characters_sub_char_classes_on_sub_char_class_id"
  end

  create_table "characters_subraces", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "subrace_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_subraces_on_character_id"
    t.index ["subrace_id"], name: "index_characters_subraces_on_subrace_id"
  end

  create_table "characters_traits", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "trait_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_traits_on_character_id"
    t.index ["trait_id"], name: "index_characters_traits_on_trait_id"
  end

  create_table "characters_weapons", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "weapon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_weapons_on_character_id"
    t.index ["weapon_id"], name: "index_characters_weapons_on_weapon_id"
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
    t.string "lang_type"
    t.text "typical_speakers", default: [], array: true
    t.string "script"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "magic_schools", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "desc"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "prof_type"
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
    t.text "language_desc"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "spells", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.text "desc"
    t.text "higher_level"
    t.string "range"
    t.text "components"
    t.string "material"
    t.boolean "ritual"
    t.string "duration"
    t.boolean "concentration"
    t.string "casting_time"
    t.integer "level"
    t.string "school"
    t.bigint "char_class_id", null: false
    t.bigint "sub_char_class_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["char_class_id"], name: "index_spells_on_char_class_id"
    t.index ["sub_char_class_id"], name: "index_spells_on_sub_char_class_id"
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

  create_table "subraces", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.bigint "race_id", null: false
    t.string "desc"
    t.text "ability_bonus"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["race_id"], name: "index_subraces_on_race_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.bigint "race_id", null: false
    t.text "subrace"
    t.string "name"
    t.text "desc", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["race_id"], name: "index_traits_on_race_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "external_id"
    t.string "external_index"
    t.string "name"
    t.string "equipment_category"
    t.string "weapon_category"
    t.string "weapon_range"
    t.string "category_range"
    t.string "cost"
    t.string "damage"
    t.string "range"
    t.string "weight"
    t.string "weapon_properties"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters_ability_scores", "ability_scores"
  add_foreign_key "characters_ability_scores", "characters"
  add_foreign_key "characters_armors", "armors"
  add_foreign_key "characters_armors", "characters"
  add_foreign_key "characters_char_classes", "char_classes"
  add_foreign_key "characters_char_classes", "characters"
  add_foreign_key "characters_features", "characters"
  add_foreign_key "characters_features", "features"
  add_foreign_key "characters_languages", "characters"
  add_foreign_key "characters_languages", "languages"
  add_foreign_key "characters_proficiencies", "characters"
  add_foreign_key "characters_proficiencies", "proficiencies"
  add_foreign_key "characters_races", "characters"
  add_foreign_key "characters_races", "races"
  add_foreign_key "characters_skills", "characters"
  add_foreign_key "characters_skills", "skills"
  add_foreign_key "characters_spells", "characters"
  add_foreign_key "characters_spells", "spells"
  add_foreign_key "characters_sub_char_classes", "characters"
  add_foreign_key "characters_sub_char_classes", "sub_char_classes"
  add_foreign_key "characters_subraces", "characters"
  add_foreign_key "characters_subraces", "subraces"
  add_foreign_key "characters_traits", "characters"
  add_foreign_key "characters_traits", "traits"
  add_foreign_key "characters_weapons", "characters"
  add_foreign_key "characters_weapons", "weapons"
  add_foreign_key "features", "char_classes"
  add_foreign_key "features", "sub_char_classes"
  add_foreign_key "spells", "char_classes"
  add_foreign_key "spells", "sub_char_classes"
  add_foreign_key "sub_char_classes", "char_classes"
  add_foreign_key "subraces", "races"
  add_foreign_key "traits", "races"
end
