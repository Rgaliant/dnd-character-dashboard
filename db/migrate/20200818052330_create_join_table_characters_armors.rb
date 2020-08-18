class CreateJoinTableCharactersArmors < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :armors do |t|
      # t.index [:character_id, :armor_id]
      # t.index [:armor_id, :character_id]
    end
  end
end
