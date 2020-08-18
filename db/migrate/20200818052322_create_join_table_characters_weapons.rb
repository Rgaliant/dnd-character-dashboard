class CreateJoinTableCharactersWeapons < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :weapons do |t|
      # t.index [:character_id, :weapon_id]
      # t.index [:weapon_id, :character_id]
    end
  end
end
