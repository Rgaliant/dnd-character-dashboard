class AddAbilityScoreToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :ability_score, null: false, foreign_key: true
    add_reference :characters, :skill, null: false, foreign_key: true
    add_reference :characters, :proficiency, null: false, foreign_key: true
    add_reference :characters, :language, null: false, foreign_key: true
    add_reference :characters, :char_class, null: false, foreign_key: true
    add_reference :characters, :sub_char_class, null: false, foreign_key: true
    add_reference :characters, :race, null: false, foreign_key: true
    add_reference :characters, :weapon, null: false, foreign_key: true
    add_reference :characters, :armor, null: false, foreign_key: true
    add_reference :characters, :spell, null: false, foreign_key: true
    add_reference :characters, :trait, null: false, foreign_key: true
  end
end
