class CreateJoinTableCharactersSpells < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :spells do |t|
      # t.index [:character_id, :spell_id]
      # t.index [:spell_id, :character_id]
    end
  end
end
