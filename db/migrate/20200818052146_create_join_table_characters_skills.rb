class CreateJoinTableCharactersSkills < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :skills do |t|
      # t.index [:character_id, :skill_id]
      # t.index [:skill_id, :character_id]
    end
  end
end
