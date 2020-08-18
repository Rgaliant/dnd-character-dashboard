class CreateCreateJoinTableCharactersProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_proficiencies do |t|
      t.references :character, null: false, foreign_key: true
      t.references :proficiency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
