class CreateCreateJoinTableCharactersAbilityScores < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_ability_scores do |t|
      t.references :character, null: false, foreign_key: true
      t.references :ability_score, null: false, foreign_key: true

      t.timestamps
    end
  end
end
