class CreateJoinTableCharactersProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :proficiencies do |t|
      # t.index [:character_id, :proficiency_id]
      # t.index [:proficiency_id, :character_id]
    end
  end
end
