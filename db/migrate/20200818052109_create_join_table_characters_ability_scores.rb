class CreateJoinTableCharactersAbilityScores < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :ability_scores do |t|
      # t.index [:character_id, :ability_score_id]
      # t.index [:ability_score_id, :character_id]
    end
  end
end
