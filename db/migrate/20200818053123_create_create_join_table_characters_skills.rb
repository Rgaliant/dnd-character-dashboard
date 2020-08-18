class CreateCreateJoinTableCharactersSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_skills do |t|
      t.references :character, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
