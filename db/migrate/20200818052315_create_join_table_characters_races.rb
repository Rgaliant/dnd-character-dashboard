class CreateJoinTableCharactersRaces < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :races do |t|
      # t.index [:character_id, :race_id]
      # t.index [:race_id, :character_id]
    end
  end
end
