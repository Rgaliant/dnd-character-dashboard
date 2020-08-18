class CreateJoinTableCharactersTraits < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :traits do |t|
      # t.index [:character_id, :trait_id]
      # t.index [:trait_id, :character_id]
    end
  end
end
